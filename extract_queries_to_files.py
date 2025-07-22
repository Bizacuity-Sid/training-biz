import os
import re

def extract_queries(raw_sql_text: str, output_dir: str = "queries"):
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Split on lines that start with a number and dot: e.g. "1. " or "12. "
    query_blocks = re.split(r"\n(?=\d+\.\s)", raw_sql_text.strip())

    for idx, block in enumerate(query_blocks, 1):
        # Find the SQL part: remove leading numbering and title
        lines = block.strip().splitlines()
        sql_lines = []

        for line in lines:
            if re.match(r"^\d+\.\s", line):
                continue  # skip title line
            sql_lines.append(line)

        # Join all the SQL lines
        sql = "\n".join(sql_lines).strip()

        # Save to qN.sql
        filename = f"q{idx}.sql"
        filepath = os.path.join(output_dir, filename)
        with open(filepath, "w") as f:
            f.write(sql)

        print(f"✅ Saved: {filepath}")

# Example usage:
if __name__ == "__main__":
    # Paste the long SQL block text into this string or read from a .txt file
    with open("all_queries.txt", "r") as file:
        raw_sql_text = file.read()

    extract_queries(raw_sql_text, output_dir="queries")
