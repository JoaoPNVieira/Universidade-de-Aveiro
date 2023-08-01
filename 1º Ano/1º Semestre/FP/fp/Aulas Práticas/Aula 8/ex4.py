# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {}".format("Numero", "Nome"))
    for num in dic:
        print("{:>12s} : {}".format(num, dic[num]))

def numberToName(dict, n):
    """Returns the name associated to the given phone number,
    or the same number, if not in the contacts."""
    for i in dict:
        if n == i:
            name = dict[i]
            break
    else:
        name = n
    return n

def filterPartName(contacts, partName):
    """Returns a new dict with the contacts whose names contain partName."""
    ...

def addContact(dict):
    num = input("Escreva o número que deseja adicionar: ")
    nome = input("Escreva o nome correspondente ao número: ")
    if num in contactos:
        x = input("O número já existe. Pretende alterar? (Y/N)")
        if x.upper() == "Y":
            dict[num] = nome
    else:
        dict[num] = nome

def removeContact(dict):
    print("Remover contacto")
    num = input("Escreva o número que deseja remover: ")
    if num in contactos:
        del dict[num]
    else:
        print("O contacto não existe")

def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


#MAIN:

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
    elif op == "A":
        addContact(contactos)
    elif op == "R":
        removeContact(contactos)
    elif op == "N":
        number = input("Escreva o número que deseja procurar: ")
        print(numberToName(contactos, number))

    else:
        print("Não implementado!")
