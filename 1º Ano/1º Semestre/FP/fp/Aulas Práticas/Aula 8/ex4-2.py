# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {}".format("Numero", "Nome"))
    for num in dic:
        print("{:>12s} : {}".format(num, dic[num]))

def numberToName(contacts, number):
    """Returns the name associated to the given phone number,
    or the same number, if not in the contacts."""
    if number in contacts:
        return contacts[number]
    else:
        return number

def validateTelNumber():
    while True:
        number = input("Insira o número a adicionar: ")
        if number.isdigit() and len(number) > 3:
            telNumber = number
            break
    return number

def listContact(number, contactsDict):
    if number in contactsDict:
        while True:
            n = input("O número já existe. Pretende alterar o contacto (Y/N): ")
            if n.upper() in ["Y" , "N"]:
                break
        if n.upper() == "N":
            print("Contacto inalterado!")

        elif n.upper() == "Y":
            name = input("Escreva nome do contacto a adicionar: ")
            contactsDict[number] = name
    else:
        name = input("Escreva nome do contacto a adicionar: ")
        contactsDict[number] = name


def filterPartName(contacts, partName):
    newDict = {}
    for i in contacts:
        if partName in contacts[i]:
            newDict[i] = contacts[i]
    return newDict


def removeContact(number, contactsDict):
    if number in contactsDict:
        del contactsDict[number]
        print("Contacto removido com sucesso!")
    else:
        print("Não existe.")

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
        listContact(validateTelNumber(), contactos)
    elif op == "R":
        removeContact(validateTelNumber(), contactos)
    elif op == "N":
        print(numberToName(contactos, validateTelNumber()))
    elif op == "P":
        nums = filterPartName(contactos, input("Escreva o que pretende pequisar: "))
        listContacts(nums)
    else:
        print("Não implementado!")
