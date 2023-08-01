#encoding: utf8

def boletim(n,d,r,l,b):
	fim = "fim"
	while n != "fim":
		print("\n" * 10)
		caderno()
		print("1 - Democratas")
		print("2 - Republicanos")
		print("3 - Liberais")
		print("0 - Branco")
		n=input("Digite o numero correspondente ao seu voto: ")
		if n == "1":
			d+=1
		if n == "2":
			r+=1
		if n == "3":
			l+=1
		if n == "0":
			b+=1			
		else:
			pass
	return n,d,r,l,b
	
def caderno():
	encontrou = False
	nr=int(input("Seu número de eleitor: "))
	nr= str(nr)
	fin=open("caderno.txt", "r")
	if len(nr) < 6:
		print("Número de eleitor muito curto")
		return caderno()
	if len(nr) >= 6:		
		for linha in fin:
			linha= linha.strip()
			linha= linha.split(",")[0]
			linha = [linha]
			if nr in linha:
				encontrou = True
				break
		if encontrou == True:
			print("O seu número consta na lista de eleitores! Pode Votar!")
		else: 
			print("O seu número não consta na lista de eleitores!")
			return caderno()
						
def contagem(nu,de,re,li,br):
	with open("caderno.txt") as f:
		total_eleitores = len(f.readlines())
	abstencao = total_eleitores - (de + re + li + br)
	abstencaox = round(abstencao/total_eleitores * 100)
	total_eleitores_b_a = total_eleitores - br -abstencao
	democratas = de
	democratasx = round(de/total_eleitores_b_a *100,2)
	republicanos = re
	republicanosx = round(re/total_eleitores_b_a *100, 2)
	liberais= li
	liberaisx= round(li/total_eleitores_b_a *100,2)
	brancos = br
	print("Democratas: {} votos  ({}%)".format(democratas, democratasx))
	print("Republicanos: {} votos  ({}%)".format(republicanos, republicanosx))
	print("Liberais: {} votos  ({}%)".format(liberais, liberaisx))
	print("Brancos: {} votos".format(brancos))
	print("Abstenção: {} pessoas ({}%)".format(abstencao, abstencaox))

def eleicao(n,d,r,l,b):
	deputados=int(input("Quanto deputados para a assembleia? "))
	deputados_total= 1
	dep_d = 0
	dep_r =0
	dep_l =0
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




n,d,r,l,b = boletim(0,0,0,0,0)
nu,de,re,li,br = boletim(n,d,r,l,b)
contagem(nu,de,re,li,br)
n,d,r,l,b = boletim(n,d,r,l,b)
eleicao(n,d,r,l,b)

