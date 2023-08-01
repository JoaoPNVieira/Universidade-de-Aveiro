#encoding: utf-8
#F1_2015_2016 - mastermind

from random import *

def segredo():
	codigo = randint(0,9999)
	#codigo=3989
	print (codigo)
	return codigo

def valida(tentativaUser):
	controlo=True
	tentativa=input("Tentativa {}: ".format(str(tentativaUser)))
	for t in tentativa:
		if t not in ["0","1","2","3","4","5","6","7","8","9"] or len(tentativa)!=4:
			controlo=False
	if controlo == False:
		print("Use 4 algarismos!")
		return valida(tentativaUser)
	else:
		return tentativa
	
def pontuacao(codigo, tentativa):
	codigo=str(codigo)
	tentativa=str(tentativa)
	
	index=-1
	certosAbsolutos=0
	while index < (len(codigo)-1):
		index+=1
		if codigo[index] == tentativa[index]:
			certosAbsolutos+=1
	#print(certosAbsolutos)	
	
	certosRelativos=0
	
	for t in tentativa:
		if t in codigo:
			certosRelativos+=1
	#print(certosRelativos)
	certosFora = certosRelativos -certosAbsolutos 
	return certosAbsolutos ,  certosFora

def pontos(certosAbsolutos ,certosFora , total):
	pAbs= certosAbsolutos *10
	pFora= certosFora *1
	pJogada=pAbs+pFora
	pTotal = total+ pAbs+pFora
	print("{} certas, {} no lugar errado, {} pontos, total: {} pontos".format(certosAbsolutos, certosFora, pJogada, pTotal))
	return pTotal
	
	
def jogo():
	codigo = segredo()
	tentativaUser=0
	tentativa=0
	total=0
	while tentativaUser <10 and codigo != tentativa:
		tentativaUser+=1
		tentativa= valida(tentativaUser)
		tentativa=int(tentativa)
		certosAbsolutos ,  certosFora = pontuacao(codigo, tentativa)
		total = pontos(certosAbsolutos ,certosFora , total)
		
		#print(codigo)
		#print(tentativa)
	if tentativaUser <10:
		tentativaTotal = 10 - (tentativaUser)
		total = total+ 100* tentativaTotal
	print ("Parabéns! Conseguiu em {} tentativas.".format(str((tentativaUser))))
	print("Total: {} pontos! ".format(str(total)))
	return total
	
def escreverFicheiro(total):
	fout = open("recorde.txt")
	for lines in fout:
		lines = lines.strip()
		p= lines.split(":")[1]
		pontos= p.split()[0]
	pontos=int(pontos)
	if total > pontos:
		nome=input ("Novo Recorde! Nome? ")
		escrever = open("recorde.txt", "w")
		escrever.write("{}{} {} {}".format(nome,":",total,"pontos!"))
		escrever.close()

	

total = jogo()	
escreverFicheiro(total)
