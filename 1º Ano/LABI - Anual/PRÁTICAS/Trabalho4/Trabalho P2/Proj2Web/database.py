import sqlite3
from datetime import datetime

con = sqlite3.connect("../database.db")

# CRIAR CORSOR:
c = con.cursor()

c.execute("DROP TABLE IF EXISTS Votes") #Importante para recriar tabelas com novos updates cada vez que corre
c.execute("""CREATE TABLE Votes
    ("vote_id" INTEGER PRIMARY KEY AUTOINCREMENT, 
	"song_id" INTEGER NOT NULL, 
	"vote" INTEGER NOT NULL CHECK(vote = 1 or vote = -1)
	)""")

c.execute("DROP TABLE IF EXISTS Musics")
c.execute("""CREATE TABLE Musics
    ("music_id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"author_id" INTEGER NOT NULL,
	"name" TEXT NOT NULL, 
	"v_numb" INTEGER DEFAULT 0,
	"author" TEXT NOT NULL,
	"upload_date" DATE,
    "ext"   TEXT
    )""")
    
c.execute("DROP TABLE IF EXISTS Sounds")
c.execute("""CREATE TABLE Sounds
    ("sound_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "votes" INTEGER DEFAULT 0,
    "authors_id" INTEGER NOT NULL,
    "authors" TEXT NOT NULL, 
    "upload_date" DATE
     )""")

c.execute("DROP TABLE IF EXISTS Effects")
c.execute("""CREATE TABLE Effects
    ("effect_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL, 
    "votes" INTEGER DEFAULT 0
    )""")

c.execute("DROP TABLE IF EXISTS Creation")
c.execute("""CREATE TABLE Creation
    ("creation_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "bpm" INTEGER DEFAULT 80,
    "authors" TEXT NOT NULL,
    "upload_date" DATE 
    )""")
    
if __name__ == '__main__':
	con.commit()
	con.close()
