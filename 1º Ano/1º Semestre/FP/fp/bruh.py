def val(x):
	af = len(x)
	a=0
	if x[0] == '+':
		a = 0
		for num in x[1:]: 
			if num.isdigit():
				a += 1
		if a >= 3 and a==(af-1):
			return True
		else:
			return False 
	elif x[0].isdigit():
		a = 1
		for num in x[1:]: 
			if num.isdigit():
				a += 1
		if a >= 3 and a == af:
			return True
		else:
			return False 
	else:
		return False
def callOf():
	callO = input('Numero de Origem?')
	vali = val(callO)
	if vali == False:
		print('Numero Inválido')
		callOf()
	return callO
		
def callDf():
	callD = input('Numero de Destino?')
	vali = val(callD)
	if vali == False:
		print('Numero Inválido')
		callDf()
	
def reg(x,z):
	print('1) Opção? 1')
	a = callOf()
	b = callDf()
	dur = input('Tempo em segundos.')
	z = (a,b)
	x.append(a)
	main()
	
def cl(x):
	clF = []
	clOut = []
	for a in x: 
		if a in clF: 
			clOut.append(a)
		else: 
			clF.append(a)
	return clF 

def main():
	print("1) Registar chamada \n" 
			"2) Ler ficheiro \n" 
			"3) Listar clientes \n" 
			"4) Fatura \n"
			"5) Terminar")
	op = int(input("0) Opção?"))
	
	
	while op != 5:
		if op == 1:
			reg(clientes, chamadas)
		if op == 3:
			print(cl(clientes))
			main()

			
clientes = []
chamadas = {}
main()
print(chamadas)
