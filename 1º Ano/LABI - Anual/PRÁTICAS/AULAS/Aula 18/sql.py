import sqlite3 as sql
import sys

def main(argv):
	db = sql.connect("database.db") 	# establece ligação à base de dados e devolve um obj. que representa a ligação.
										# Se o argumento argv[1] for igual a ":memory:" a db é criada em memória e apagada no final do programa:
										# -> Útil para armazenar info temporária
	
	result = db.execute("SELECT * FROM contacts;") 	# Executa comando SQL
	rows = result.fetchall()						# Seleciona todas as linhas
	for r in rows:
		print(r)									# Ciclo que faz print de todas as linhas
	
	for r in rows:
		print(r)									# Ciclo que faz print de todas as linhas
	
	#while True:
	#	row = result.fetchone()							# Seleciona uma linha (para linhas de tuples muito grandes)
	#	if not row:
	#		break
	#	print(row)
	
	#for row in result:								# Ciclo que faz print de linhas um a um 
	#	print(row)
	
	db.close()										# Fechar base de dados

main(sys.argv)
