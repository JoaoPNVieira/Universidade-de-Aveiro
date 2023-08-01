#encoding:utf-8
#M1_2015_2016
#Deputados

from math import *

def lerCaderno():
	eleitores=[]
	fin=open("caderno.txt")
	for lines in fin:
		lines=lines.strip()
		numeros= lines.split()[0]
		print
		numeros=numeros.split(",")[0]
		eleitores.append(int(numeros))
	#print(eleitores)
	return eleitores

def mesa():
	print("1 - Democratas")
	print("2 - Republicanos")
	print("3 - Liberais")
	print("0 - Branco")
	voto= input("Digite o nº correspondente ao seu voto: ")
	if voto not in ["1", "2","3","0"]:
		print("Voto incorreto!")
		return mesa()
	else:
		return voto

def verificarUser(eleitores):
	nr=input("Número de Eleitor: ")
	controlo = False
	if nr != "fim":
		for pessoas in eleitores:
			if int(nr)==int(pessoas):
				controlo = True
	return controlo,nr
def cabine():

	###########################
	vDem=0
	vRep=0
	vLib=0
	vBra=0
	###########################
	eleitores=lerCaderno()
	totalEleitores=len(eleitores)
	controlo,nr=verificarUser(eleitores)
	while nr != "fim":
		if controlo==False:
			return verificarUser(eleitores)
		else:
			voto=mesa()
			if voto=="1":
				vDem+=1
			elif voto == "2":
				vRep+=1
			elif voto =="3":
				vLib+=1
			else:
				vBra+=1
		controlo,nr=verificarUser(eleitores)
	totalVotos= vDem+vRep+vLib+vBra
	Abs = totalEleitores - totalVotos

	print("Democratas: {} votos ({}%)".format(vDem, round(vDem/totalVotos * 100,2)))
	print("Republicanos: {} votos ({}%)".format(vRep, round(vRep/totalVotos * 100,2)))
	print("Liberais: {} votos ({}%)".format(vLib, round(vLib/totalVotos * 100,2)))
	print("Brancos: {} votos ({}%)".format(vBra, round(vBra/totalVotos * 100,2)))
	print("Abstenção: {} votos ({}%)".format(Abs, round(Abs/totalEleitores * 100,2)))

cabine()
