#encoding:utf-8
#M1_2016_2017
#Mensalidade

def mensal(nome):#Terá que levar um parametro
	mensalidade=input("Mensalidade {} : ".format(nome))
	controlo=0
	for n in mensalidade:
		if n not in ["0","1","2","3","4","5","6","7","8","9","."]:
			controlo =1
	if controlo==1:
		print ("Inseriu um valor errado!")
		return mensal(nome)
	else:
		return mensalidade

def dura(nome):
	duracao=input("Duracação do contrato em meses ({}) : ".format(str(nome)))

	controlo=0
	for n in duracao:
		if n not in ["0","1","2","3","4","5","6","7","8","9","."] or int(duracao)%6 !=0:
			controlo =1
	if controlo==1:
		print ("Inseriu um valor errado!")
		return dura(nome)
	else:
		return duracao

def menor(listaMensal): #Vai receber uma LISTA de mensalidades
	minimo=listaMensal[0]
	for m in listaMensal:
		if m < minimo:
			minimo=m
	return minimo
	
def descontos(nome): #Falta um argumento
	meses=input("Meses oferecidos: ")
	descontoTele=input("Desconto por telemóvel: ")
	if float(descontoTele) != 0:
		nrTele=input("Numeros de telemovel: ")
	else:
		nrTele=0
	return meses, descontoTele, nrTele

def extras(nome):
	valorExtra=-1
	totalExtra=0
	while valorExtra !="0":
		valorExtra=input("Preço de UM extra ({}): ".format(nome))
		#falta verificat
		totalExtra+= float(valorExtra)
	return totalExtra

def empresa(nome):
	mensalidade=float(mensal(nome))
	duracao=int(dura(nome))
	meses, descontoTele, nrTele = descontos(nome)
	total = mensalidade * (duracao-int(meses)) -(int(descontoTele) *  int(nrTele))
	print("Total {} : {}".format(str(nome),str(total)))
	return [nome,total,duracao]

def main():
	lista=[]
	empresa1=empresa("MEO")
	lista.append(empresa1)
	empresa2=empresa("NOS")
	lista.append(empresa2)
	empresa3=empresa("VODAFONE")
	lista.append(empresa3)
	extra1=extras("MEO")
	lista[0].append(extra1)
	extra2=extras("NOS")
	lista[1].append(extra2)
	extra3=extras("VODAFONE")
	lista[2].append(extra3)
	#print(lista)
	listaPreco=[]
	listaNome=[]
	print("-------------------------------------")
	print("|{:>9}{:>3}{:>9}{:>3}{:>9}{:>3}".format("OPERADOR","|","TCO","|","TCO/MES","|"))
	for elementos in lista:
		nome =elementos[0]
		tco= elementos[1]+elementos[3]*elementos[2]
		tcoM= round(tco / elementos[2] ,2)
		#print(nome)
		#print(tco)
		#print(tcoM)
		listaPreco.append(tcoM)
		listaNome.append(nome)
		print("|{:>9}{:>3}{:>9}{:>3}{:>9}{:>3}".format(str(nome),"|",str(tco),"|",str(tcoM),"|"))
	print("-------------------------------------")
	mini=menor(listaPreco)
	index=-1
	while index <(len(listaPreco)-1):
		index+=1
		if mini== listaPreco[index]:
			melhor=listaNome[index]
	print("Melhor operador: {}".format(melhor))
	return melhor	
	
	
	
main()

		
	
