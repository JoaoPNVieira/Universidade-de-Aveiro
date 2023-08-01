#encoding:utf8

def listas():
	original = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
	chave = ["D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C"]
	return original, chave

def menu(original,chave):
	utilizador = input("(C)odificar, (D)escodificar ou (S)air: ")
	utilizador=utilizador.upper()
	if utilizador == "C":
		codificar(original, chave)
	elif utilizador == "D":
		descodificar(original, chave)
	elif utilizador =="S":
		return False
	else:
		return menu(original,chave)


def codificar(original, chave):
	codificar_lista=[]
	cod = str(input("Palavra a codificar: "))
	cod= cod.upper()
	for char in cod:
		codificar_lista.append(char)
	ic=-1
	while ic  < (len(codificar_lista)-1):
		ic+=1
		for index_chave in range(0, (len(chave)-1)):
			if str(codificar_lista[ic]) == str(original[index_chave]):
				print (chave[index_chave])
		
def descodificar(original, chave):
	codificar_lista=[]
	cod = str(input("Palavra a codificar: "))
	cod= cod.upper()
	for char in cod:
		codificar_lista.append(char)
	ic=-1
	while ic  < (len(codificar_lista)-1):
		ic+=1
		for index_chave in range(0, (len(chave)-1)):
			if str(codificar_lista[ic]) == str(chave[index_chave]):
				print (original[index_chave])


	
	
		
		
	
	





original,chave = listas()
menu(original,chave)
