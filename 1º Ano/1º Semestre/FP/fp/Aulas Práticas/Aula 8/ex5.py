# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {:^24s} : {}".format("Numero", "Nome", "Morada"))
    for num in dic:
        print("{:>12s} : {:^24s} : {}".format(num, dic[num][0], dic[num][1]))

def numberToName(contacts, number):
    """Returns the name associated to the given phone number,
    or the same number, if not in the contacts."""
    if number in contacts:
        return contacts[number][0]
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
            morada = input("Escreva a morada do contacto a adicionar: ")
            contactsDict[number] = (name, morada)
    else:
        name = input("Escreva nome do contacto a adicionar: ")
        morada = input("Escreva a morada do contacto a adicionar: ")
        contactsDict[number] = (name, morada)


def filterPartName(contacts, partName):
    newDict = {}
    for i in contacts:
        if partName in contacts[i][0]:
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
contactos = {"234370200": ("Universidade de Aveiro","Santiago, Aveiro"),
    "727392822": ("Cristiano Aveiro","Porto"),
    "387719992": ("Maria Matos","Viseu"),
    "887555987": ("Marta Maia","Lisboa"),
    "876111333": ("Carlos Martins","Coimbra"),
    "433162999": ("Ana Bacalhau", "Vila Nova de Gaia"),
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
