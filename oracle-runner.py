import oracledb
import sys

def run_sql_file(sql_path, output_path, conn_str):
    try:
        with open(sql_path, 'r') as f:
            sql = f.read()

        connection = oracledb.connect(conn_str)
        cursor = connection.cursor()

        # Set schema to classicmodels
        cursor.execute("ALTER SESSION SET CURRENT_SCHEMA = classicmodels")

        # Execute the SQL from file
        cursor.execute(sql)
        rows = cursor.fetchall()

        with open(output_path, 'w') as f:
            for row in rows:
                f.write(str(row) + "\n")

        cursor.close()
        connection.close()

    except Exception as e:
        print(f"❌ Error executing {sql_path}: {e}", file=sys.stderr)
        sys.exit(1)
