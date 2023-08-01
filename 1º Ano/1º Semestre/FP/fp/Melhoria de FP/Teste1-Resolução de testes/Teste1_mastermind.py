#encoding:utf8
from random import randint

def segredo():
	segredo =randint(1000,9999)
	return segredo

def valida():
	t=1
	tentativa=int(input("Tentativa {}: ".format(t)))
	tentativa=str(tentativa)
	if len(tentativa) == 4:
		return tentativa
	elif len(tentativa) != 4:
		print ("A tentativa tem de ter 4 algarismos")
		return valida()

def pontuacao(segredo):
	t=1
	tentativa=valida()
	segredo=str(segredo)
	c=0
	pontos=0
	i=0
	pc=0
	e=0
	while tentativa !=segredo:	
		for nt in tentativa:
			nt=str(nt)
			if nt in segredo:
				c+=1
		while i < len(segredo):
			if segredo[i] == tentativa[i]:
				pc+=1
				i+=1
			if segredo[i] != tentativa[i]:
				i+=1
		c=c-pc
		e=len(segredo) - c -pc
		t+=1
		pontos_ronda = c*1 + pc*10
		pontos= pontos + pontos_ronda
		pontos=pontos
		print(pc)
		print(c)
		print(e)
		print(pontos)
		valida()
		t+=1


segredo= segredo()
print(segredo)
pontuacao(segredo)
		
