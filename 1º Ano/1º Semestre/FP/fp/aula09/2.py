# Complete este programa como pedido no guião da aula.
def addContact():
	cName = input('Qual o nome do novo contacto?')
	cNum = input('Qual o numero do novo contacto?')
	dictNC = {cNum: cName}
	return dictNC
 
def removeContact():
	cNm = input('Qual o numero do contacto a remover?')
	return cNm
	
def searchNum():
	num = input('Qual é o numero?')
	return num
	
def listContacts(dic):
	"""Print the contents of the dictionary as a table, one item per row."""
	print("{:>12s} : {}".format("Numero", "Nome"))
	for num in dic:
		print("{:>12s} : {}".format(num, dic[num]))

def filterPartName(contacts, partName):
	"""Returns a new dict with the contacts whose names contain partName."""
	someContacts = dict()
	for k, v in contacts.items():
		if partName.lower() in v.lower():
			someContacts[k] = v
	return someContacts

def drawTable(contacts): 
	print('{:>10} {:>10}'.format('Contacto:', 'Nome:'))
	for k, v in contacts.items():
		print('{:>10} {:>10}'.format(k, v))
	
def menu():
	"""Shows the menu and gets user option."""
	print()
	print("(L)istar contactos")
	print("(A)dicionar contacto")
	print("(R)emover contacto")
	print("Procurar (N)úmero")
	print("Procurar (P)arte do nome")
	print("(T)erminar")
	print('(D)esenhar tabela')
	op = input("opção? ").upper()   # converts to uppercase...
	return op


def main():
	"""This is the main function containing the main loop."""
	# The list of contacts (it's actually a dictionary!):
	contactos = {"234370200": "Universidade de Aveiro",
		"727392822": "Cristiano Aveiro",
		"387719992": "Maria Matos",
		"887555987": "Marta Maia",
		"876111333": "Carlos Martins",
		"433162999": "Ana Bacalhau"
		}

	op = ""
	while op != "T":
		op = menu()
		if op == "T":
			print("Fim")
		elif op == "L":
			print("Contactos:")
			listContacts(contactos)
		elif op == 'A':
			contactos.update(addContact())
		elif op == 'R':
			contactos.pop(removeContact())
		elif op == 'N':
			k = searchNum()
			if k in contactos: 
				print(contactos[k])
			else:
				print('O numero não pertence à lista de contactos')
		elif op == 'P':
			partN = input('texto a pesquisar?')
			r = filterPartName(contactos, partN)
			print(r)
		elif op == 'D':
			drawTable(contactos)
		else:
			print("Não implementado!")
	1

# O programa começa aqui
main()
