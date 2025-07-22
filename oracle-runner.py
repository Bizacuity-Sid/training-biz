import oracledb

def run_sql_file(sql_path, output_path, conn_str):
    with open(sql_path, 'r') as f:
        sql = f.read()

    connection = oracledb.connect(conn_str)  # oracledb runs in "thin" mode by default
    cursor = connection.cursor()

    cursor.execute(sql)
    rows = cursor.fetchall()

    with open(output_path, 'w') as f:
        for row in rows:
            f.write(str(row) + "\n")

    cursor.close()
    connection.close()
