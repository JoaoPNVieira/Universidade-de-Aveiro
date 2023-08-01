I = 0
med = []
media = 0
#testeanopassadoEX1
#peso = float(input("Peso (kg)?"))
#altura = float(input("Altura(m)?"))
#IMC = peso / (altura**2)
#print("O adulto tem um IMC de", IMC)
#if IMC < 18.5:
#	print("Peso Baixo")
#elif IMC < 25:
#	print("Peso Normal")
#else:
#	print("Obeso")

#testeanopassadoEX2
def IMC(fPeso, fAltura):
	fIMC = float(fPeso) / (float(fAltura)**2)
	fIMCf = '%.2f' % fIMC
	return float(fIMCf)

def classif(IMC):
	if IMC < 18.5:
		print("Peso Baixo")
	elif IMC < 25:
		print("Peso Normal")
	else:
		print("Obeso")
	
def lerValorReal (ffPeso):
	n = float(ffPeso)
	if ffPeso < 0 or ffPeso > 1000:
		print('Valor Inválido')
		newPeso = float(input('Peso(kg) ?'))
		lerValorReal(newPeso)
	else:
		print('Valor válido.')
		return n
		
def menu():
	print('Opções disponiveis:')
	print('0 - sair')
	print('1 - introduzir nova medida')
	print('2 - mostrar média atual')
	op = int(input('Opção?'))
	if op == 0:
		print('k bye then')
	elif op == 1:
		altura = float(input("Altura(m)?"))
		peso = float(input("Peso (kg)?"))
		newPeso = lerValorReal(peso)
		I = IMC(newPeso, altura)
		classif(I)
		med.append(I)
		print(I)
		menu()
	elif op == 2:
		n = len(med)
		con = 0 
		while con < n: 
			media += float(med[con])
			mediaA = media / n 
		print(mediaA)
		menu()
	else:
		print('Por favor introduza um valor válido, nomeadamente 0, ou 2')
		menu()

menu()
