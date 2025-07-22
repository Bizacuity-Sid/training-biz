# oracle_runner.py
import cx_Oracle
import sys

def run_sql_file(sql_path, output_path, conn_str):
    with open(sql_path, 'r') as f:
        sql = f.read()

    connection = cx_Oracle.connect(conn_str)
    cursor = connection.cursor()

    try:
        cursor.execute(sql)
        rows = cursor.fetchall()

        with open(output_path, 'w') as out:
            for row in rows:
                out.write('\t'.join(map(str, row)) + '\n')

    except Exception as e:
        with open(output_path, 'w') as out:
            out.write(f"ERROR: {e}\n")
    finally:
        cursor.close()
        connection.close()

if __name__ == '__main__':
    sql_path = sys.argv[1]
    output_path = sys.argv[2]
    conn_str = sys.argv[3]
    run_sql_file(sql_path, output_path, conn_str)
