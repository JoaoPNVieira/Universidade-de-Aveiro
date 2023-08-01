import mysql.connector

con = mysql.connector.connect(
		host='127.0.0.1', 
		database='database2', 
		user='root', 
		senha='')

if con.is_connected():
    db_info = con.get_server_info()
        print(db_info)
    cursor = con.cursor()
        cursor.execute("show database();")
        result = cursor.fetchall()
        print(result)

if con.is_connected():
    cursor.close()
    con.close()
