import sys
import re

def read_sql_file(file_path):
    with open(file_path, 'r') as f:
        return f.read()

def extract_cte_blocks(sql_text):
    ctes = []
    with_match = re.search(r'WITH\s+(.*?)(SELECT|INSERT|UPDATE|DELETE)', sql_text, re.IGNORECASE | re.DOTALL)
    if not with_match:
        return ctes
    with_content = with_match.group(1).strip().rstrip(',')

    parts = []
    buf = ''
    depth = 0
    for c in with_content:
        if c == '(':
            depth += 1
        elif c == ')':
            depth -= 1
        buf += c
        if depth == 0 and buf.strip().endswith(')'):
            parts.append(buf.strip().rstrip(','))
            buf = ''
    if buf.strip():
        parts.append(buf.strip().rstrip(','))

    for part in parts:
        name_match = re.match(r'(\w+)\s+AS\s*\((.*)\)$', part.strip(), re.IGNORECASE | re.DOTALL)
        if name_match:
            name = name_match.group(1)
            sql = name_match.group(2).strip()
            ctes.append((name, sql))
    return ctes

def check_duplicate_aliases_per_block(sql_block):
    aliases = re.findall(r'(?:FROM|JOIN)\s+\w+\s+(\w+)', sql_block, re.IGNORECASE)
    aliases_lower = [a.lower() for a in aliases]
    duplicates = set([a for a in aliases_lower if aliases_lower.count(a) > 1])
    if duplicates:
        return f"❌ Duplicate table aliases found: {duplicates}"
    return None

def check_required_as_aliases(sql_block):
    """
    New function: check that function expressions like SUM(), EXTRACT(), etc. have AS alias.
    """
    issues = []
    select_matches = re.findall(r'SELECT\s+(.*?)\s+FROM', sql_block, re.IGNORECASE | re.DOTALL)
    for select_clause in select_matches:
        expressions = []
        buf = ''
        depth = 0
        for char in select_clause:
            if char == ',' and depth == 0:
                expressions.append(buf.strip())
                buf = ''
            else:
                buf += char
                if char == '(':
                    depth += 1
                elif char == ')':
                    depth -= 1
        if buf.strip():
            expressions.append(buf.strip())

        for expr in expressions:
            expr = expr.strip()
            # Match any function call like SUM(...), EXTRACT(...), etc.
            if re.match(r'^(SUM|COUNT|AVG|MIN|MAX|EXTRACT)\s*\(.*?\)', expr, re.IGNORECASE):
                if not re.search(r'\)\s+AS\s+\w+$', expr, re.IGNORECASE):
                    issues.append(f"❌ Expression requires AS alias: '{expr}'")
    return issues

def check_missing_aliases(sql_block, cte_names):
    issues = []
    matches = re.findall(r'(FROM|JOIN)\s+([^\s,()]+)(?:\s+([^\s,()]+))?', sql_block, re.IGNORECASE)
    for keyword, table, alias in matches:
        table_lower = table.lower()
        if alias is None and table_lower not in cte_names:
            issues.append(f"❌ Missing alias for table '{table}'")
    return issues

def is_join_condition(expr):
    parts = expr.split('=')
    if len(parts) != 2:
        return False
    left, right = parts[0].strip(), parts[1].strip()
    pattern = r'^\w+\.\w+$'
    return bool(re.match(pattern, left)) and bool(re.match(pattern, right))

def check_join_conditions(sql_block):
    issues = []
    join_pattern = re.compile(r'JOIN\s+(\w+)\s+(\w+)', re.IGNORECASE)
    for m in join_pattern.finditer(sql_block):
        after_join_pos = m.end()
        after_join_text = sql_block[after_join_pos:].lstrip()
        if not after_join_text.upper().startswith('ON '):
            issues.append("❌ JOIN without ON clause immediately after it.")
    where_match = re.search(r'WHERE\s+(.*)', sql_block, re.IGNORECASE | re.DOTALL)
    if where_match:
        where_clause = where_match.group(1)
        conditions = re.split(r'\s+AND\s+|\s+OR\s+|;', where_clause, flags=re.IGNORECASE)
        for cond in conditions:
            if '=' in cond and is_join_condition(cond):
                issues.append("⚠️ Join condition used inside WHERE clause. Prefer ON clause for joins.")
                break
    return issues

def extract_select_columns_with_aliases(select_clause):
    cols = []
    buf = ''
    depth = 0
    for c in select_clause:
        if c == ',' and depth == 0:
            if buf.strip():
                cols.append(buf.strip())
            buf = ''
        else:
            buf += c
            if c == '(':
                depth += 1
            elif c == ')':
                depth -= 1
    if buf.strip():
        cols.append(buf.strip())

    results = []
    for col in cols:
        m = re.match(r'(.+?)\s+AS\s+(\w+)$', col, re.IGNORECASE)
        if m:
            expr = m.group(1).strip().upper()
            alias = m.group(2).strip().upper()
            results.append((expr, alias))
            continue
        m = re.match(r'(.+?)\s+(\w+)$', col)
        if m:
            expr = m.group(1).strip().upper()
            alias = m.group(2).strip().upper()
            results.append((expr, alias))
            continue
        results.append((col.strip().upper(), None))
    return results

def check_group_by(sql_block):
    issues = []
    group_by_match = re.search(r'GROUP\s+BY\s+(.+?)(?:ORDER\s+BY|HAVING|$)', sql_block, re.IGNORECASE | re.DOTALL)
    if not group_by_match:
        return issues

    group_by_clause = group_by_match.group(1)
    group_by_cols = [c.strip().upper() for c in group_by_clause.split(',')]

    select_match = re.search(r'SELECT\s+(.*?)\s+FROM', sql_block, re.IGNORECASE | re.DOTALL)
    if not select_match:
        return issues
    select_clause = select_match.group(1)

    select_cols = extract_select_columns_with_aliases(select_clause)
    missing = []

    for expr, alias in select_cols:
        if re.match(r'^(SUM|COUNT|AVG|MIN|MAX)\s*\(', expr):
            continue
        if alias and alias in group_by_cols:
            continue
        if expr in group_by_cols:
            continue
        extract_match = re.match(r'(EXTRACT\s*\(.*\))', expr)
        if extract_match and extract_match.group(1) in group_by_cols:
            continue
        col_display = f"{expr} AS {alias}" if alias else expr
        missing.append(col_display)

    if missing:
        issues.append(f"❌ Missing in GROUP BY: {missing}")
    return issues

def check_missing_column_aliases(sql_block, cte_names):
    issues = []
    alias_table_map = {}
    for match in re.finditer(r'(FROM|JOIN)\s+(\w+)(?:\s+(\w+))?', sql_block, re.IGNORECASE):
        keyword, table, alias = match.groups()
        alias_table_map[(alias or table).lower()] = table.lower()

    select_match = re.search(r'SELECT\s+(.*?)\s+FROM', sql_block, re.IGNORECASE | re.DOTALL)
    if not select_match:
        return issues
    select_clause = select_match.group(1)
    select_cols = []
    buf = ''
    depth = 0
    for c in select_clause:
        if c == ',' and depth == 0:
            if buf.strip():
                select_cols.append(buf.strip())
            buf = ''
        else:
            buf += c
            if c == '(':
                depth += 1
            elif c == ')':
                depth -= 1
    if buf.strip():
        select_cols.append(buf.strip())

    for col in select_cols:
        col_strip = col.strip()
        if re.match(r'^(SUM|COUNT|AVG|MIN|MAX|EXTRACT)\s*\(', col_strip, re.IGNORECASE):
            if re.search(r'\s+AS\s+\w+$', col_strip, re.IGNORECASE) or re.search(r'\s+\w+$', col_strip):
                continue
        if '.' not in col_strip:
            if col_strip != '*' and re.match(r'^[\w_]+$', col_strip):
                if col_strip.lower() not in cte_names:
                    issues.append(f"❌ Column '{col_strip}' missing table alias prefix")
    return issues

def run_guideline_checks(file_path):
    sql_text = read_sql_file(file_path)
    ctes = extract_cte_blocks(sql_text)
    main_query_match = re.search(r'\)\s*SELECT(.*)', sql_text, re.IGNORECASE | re.DOTALL)
    main_query = main_query_match.group(1) if main_query_match else sql_text
    cte_names = set([cte[0].lower() for cte in ctes])
    violations = []

    for name, cte_sql in ctes:
        dup = check_duplicate_aliases_per_block(cte_sql)
        if dup:
            violations.append(dup)
        violations.extend(check_missing_aliases(cte_sql, cte_names))
        violations.extend(check_required_as_aliases(cte_sql))
        violations.extend(check_join_conditions(cte_sql))
        violations.extend(check_group_by(cte_sql))
        violations.extend(check_missing_column_aliases(cte_sql, cte_names))

    dup_main = check_duplicate_aliases_per_block(main_query)
    if dup_main:
        violations.append(dup_main)
    violations.extend(check_missing_aliases(main_query, cte_names))
    violations.extend(check_required_as_aliases(main_query))
    violations.extend(check_join_conditions(main_query))
    violations.extend(check_group_by(main_query))
    violations.extend(check_missing_column_aliases(main_query, cte_names))

    if violations:
        print("🚨 SQL Guideline Violations Found:")
        for v in violations:
            print(f"- {v}")
    else:
        print("✅ No SQL guideline violations found.")

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python sql_guideline_checker.py <sql_file_path>")
        sys.exit(1)
    file_path = sys.argv[1]
    run_guideline_checks(file_path)
