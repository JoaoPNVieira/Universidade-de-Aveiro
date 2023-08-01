import sqlite3 as sql
import sys

def main(argv):
	db = sql.connect("database.db")
	result = db.execute("SELECT fname FROM contacts;") 	# Executa comando SQL
	rows = result.fetchall()
	c = 0
	for r in rows:
		print(r)
		c += 1
	print(c)
	
	domain = input("Domínio de email? ")
	info = db.execute("SELECT * FROM contacts WHERE fname LIKE ? OR lname LIKE ? OR email LIKE ?", (domain,) ) # Prepared Statement
	print(info)
	db.close()

main(sys.argv)
