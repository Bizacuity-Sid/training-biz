import oracledb
import sys
import re

def run_sql_file(sql_path, output_path, conn_str):
    try:
        print(f"📂 Reading SQL from: {sql_path}")
        print("🔗 Connecting to DB...")

        with open(sql_path, 'r') as f:
            sql = f.read()

        # Parse the connection string: user/password@host:port/service
        match = re.match(r'([^/]+)/([^@]+)@([^:]+):(\d+)/(.+)', conn_str)
        if not match:
            raise ValueError("Invalid connection string format.")

        user, password, host, port, service = match.groups()
        dsn = f"{host}:{port}/{service}"

        # Establish the connection
        connection = oracledb.connect(user=user, password=password, dsn=dsn)
        cursor = connection.cursor()

        # Set schema to classicmodels
        cursor.execute("ALTER SESSION SET CURRENT_SCHEMA=classicmodels")

        # Run the SQL
        sql = sql.strip()
        if sql.endswith(';'):
            sql = sql[:-1]

        cursor.execute(sql)
        rows = cursor.fetchall()

        # Write output
        with open(output_path, 'w') as f:
            for row in rows:
                f.write(str(row) + "\n")

        cursor.close()
        connection.close()

    except Exception as e:
        print(f"❌ Error executing {sql_path}: {e}", file=sys.stderr)
        sys.exit(1)

# Actually run it if script is called directly
if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python oracle-runner.py <sql_path> <output_path> <connection_string>")
        sys.exit(1)

    run_sql_file(sys.argv[1], sys.argv[2], sys.argv[3])
