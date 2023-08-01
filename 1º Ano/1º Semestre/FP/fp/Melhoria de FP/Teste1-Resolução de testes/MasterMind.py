#encoding:utf-8
from random import randint

def segredo():
	segredo= randint(1000,9999)
	print(segredo)
	return(segredo)
a=1
def tentativas(a):
	tentativa=str(input("Tentativa "+str(a)+" :" ))
	for t in tentativa:
		if t in "1234567890" and len(tentativa) ==4:
			return tentativa
		else:
			print("ERRO!")
			return tentativas(a)

def pontuacao(segredo, tentativa):
	l_segredo = []
	for s in str(segredo):
		l_segredo.append(s)
	l_tentativa=[]	
	for te in str(tentativa):
		l_tentativa.append(te)
	i_t=-1
	iguais_geral=0
	iguais_sitio=0
	while i_t < len(str(tentativa))-1:
		i_t+=1
		if str(l_tentativa[i_t]) == str(l_segredo[i_t]):
			iguais_sitio +=1
		elif l_tentativa[i_t] in l_segredo:
			iguais_geral +=1

	diferentes = len(str(tentativa))- iguais_geral - iguais_sitio
	return iguais_sitio,iguais_geral, diferentes
	
def jogo():
	a=1
	tentativa=tentativas(a)
	iguais_sitio,iguais_geral, diferentes = pontuacao(segredo, tentativa)
	j=1
	print("Iguais no síto certo: " +str(iguais_sitio))
	print("Iguais no síto errado: " +str(iguais_geral))
	print("Diferentes: " + str(diferentes))
	print("")
	pontos= 10*iguais_sitio + 1*iguais_geral
	print("Pontos da jogada = {}".format(pontos))
	print("")
	
	if iguais_sitio == 4:
		pontos = pontos + 100*(10-j)
		print("")
		print("Segredo = {}".format(segredo))
		print("Acertaste no segredo!!!")
		print("Pontuação Final = {}".format(pontos))
	elif tentativa != segredo:
		while j <=10:
			j+=1
			if tentativa != segredo:
				a+=1
				tentativa=tentativas(a)
				iguais_sitio,iguais_geral, diferentes = pontuacao(segredo, tentativa)
				print("Iguais no síto certo: " +str(iguais_sitio))
				print("Iguais no síto errado: " +str(iguais_geral))
				print("Diferentes: " + str(diferentes))
				print("")
				pontos= pontos + 10*iguais_sitio + 1*iguais_geral
				print("Pontos da jogada = {}".format(pontos))
				print("")
			if iguais_sitio == 4:
				pontos = pontos + 100*(10-j)
				print("")
				print("Segredo = {}".format(segredo))
				print("Acertaste no segredo!!!")
				print("Pontuação Final = {}".format(pontos))
				break
			return pontos





segredo = segredo()

	
jogo()
