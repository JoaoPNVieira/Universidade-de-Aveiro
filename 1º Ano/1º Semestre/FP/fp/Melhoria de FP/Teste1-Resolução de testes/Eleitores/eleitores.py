#encoding:utf-8
from random import randint
def boletim():
	print("ESCOLHA EM QUEM VOTAR")
	print("1 – Democratas")
	print("2 – Republicanos")
	print("3 – Liberais")
	print("0 - Branco")
	voto= input("Digite o número correspondente ao seu voto: ")
	return voto
		
	
	
def verificar():
	l_numeros=[]
	l_pessoas=[]
	fin = open("caderno.txt")
	for linhas in fin:
		linhas.strip()
		pessoas=(linhas.split(",")[1])
		numeros=str(linhas.split(",")[0])
		linhas.strip()
		l_numeros.append(numeros)
		l_pessoas.append(pessoas)	
	eleitor =input("Nº de Eleitor: ")
	eleitor = str(eleitor)
	for l_numeros_i in range(0,len(l_numeros)-1): 
		if eleitor == l_numeros[l_numeros_i]:
			print("Nome: {}PODE VOTAR!".format(l_pessoas[l_numeros_i]))
			print("")
			return boletim()
	print("Erro! O seu número não consta na lista de voto!")
	return verificar()		
	
def contagem():
	voto="z"
	fim="fim"
	d=0
	r=0
	l=0
	b=0
	while voto != fim:
		voto=verificar()
		if voto == str(1):
			d+=1
		if voto == str(2):
			r+=1
		if voto == str(3):
			l+=1
		if voto == str(0):
			b+=1
	print("RESULTADOS")
	print("Democratas: {} votos ({}%)".format(d, round((d/(d+l+r)*100),2)))
	print("Republicanos: {} votos ({}%)".format(r, round((r/(d+l+r)*100),2)))
	print("Liberais: {} votos ({}%)".format(l, round((l/(d+l+r)*100),2)))
	print("Brancos: {} votos".format(b))
	print("Abstenção: {}%".format(((1000-(d+l+b+r))/1000)*100))
	return d,r,l,b
	
def distribuicao(d,r,l,b):
	deputados=int(input("Qual o total de deputados a distribuir)"))
	dep_d=0
	dep_r=0
	dep_l=0
	deputados_total=1


	while deputados_total <= deputados:
		d=float(d)
		r=float(r)
		l=float(l)
		if d !=r or d!=l or r!=d or r!=l or l!=d or l!=r:
			m = max(d, r, l)
			if m == d:
				d=d/2
				dep_d += 1
				deputados_total += 1
			if m == r:
				r=r/2
				dep_r += 1
				deputados_total += 1
			if m == l:
				l=l/2
				dep_l += 1
				deputados_total += 1
		if d ==r or d==l or r==d or r==l or l==d or l==r:
			partido_menos = min(dep_d , dep_r , dep_l)
			if partido_menos == dep_d and partido_menos != dep_r and partido_menos != dep_l :
				d=d/2
				dep_d += 1
				deputados_total += 1
			if partido_menos == dep_r and partido_menos != dep_d and partido_menos != dep_l:
				r=r/2
				dep_r += 1
				deputados_total += 1
			if partido_menos == dep_l and partido_menos != dep_d and partido_menos != dep_r:
				l=l/2
				dep_l += 1
				deputados_total += 1
	
	print("Deputados Democratas : {}".format(dep_d))
	print("Deputados Republicanos : {}".format(dep_r))
	print("Deputados Liberais : {}".format(dep_l))		
	return dep_d, dep_r, dep_l
	
d,r,l,b=contagem()
distribuicao(d,r,l,b)

