import sqlite3
import json

#Variaveis globais:
msg = {}

#Gerar um dicionario com info para conversão em json
def genD(cur, row):
	for m, col in enumerate(cur.description):
		msg[col[0]] = row[m]
	return msg

#fazer o retorno de um dicionario em json
def getMusic():
	db = sqlite3.connect("database.db")
	db.row_factory = genD
	cur = db.cursor()
	return json.dumps(cur.execute("SELECT name FROM Musics WHERE music_id = ?").fetchall())
