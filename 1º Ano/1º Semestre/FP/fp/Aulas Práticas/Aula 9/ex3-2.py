# Complete este programa como pedido no guião da aula.

def lerFicheiro():
    n = input("Escreva o nome do ficheiro que deseja importar: ")
    try:
        fin = open(n, "r")
    except:
        print("Nome de ficheiro inválido.")
    else:
        contactsDict = {}
        for i in fin:
            i = i.rstrip().rsplit(",")
            contactsDict[i[0]] = i[1]
        fin.close()
        print("Contactos importados com sucesso!")
        return contactsDict

def gravarFicheiro(contactos):
    n = input("Escreva o nome do ficheiro onde deseja guardar os contactos: ")
    try:
        fin = open(n, "w")
    except:
        print("Something went wrong.")
    else:
        for i in contactos:
            fin.write("{},{}\n".format(i, contactos[i]))
        fin.close()
        print("Contactos gravados com sucesso!")

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
    print("(I)mportar ficheiro de contactos")
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(G)ravar ficheiro com contactos")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


#MAIN:

# The list of contacts (it's actually a dictionary!):
contactos = {}

op = ""
while op != "T":
    op = menu()
    if op == "T":
        print("Fim")
    elif op == "I":
        n = lerFicheiro()
        if n != None:
            contactos = n
    elif op == "L":
        if len(contactos) != 0:
            print("Contactos:")
            listContacts(contactos)
        else:
            print("Contactos inexistentes.")
    elif op == "A":
        listContact(validateTelNumber(), contactos)
    elif op == "R":
        if len(contactos) != 0:
            removeContact(validateTelNumber(), contactos)
        else:
            print("Contactos inexistentes.")
    elif op == "N":
        if len(contactos) != 0:
            print(numberToName(contactos, validateTelNumber()))
        else:
            print("Contactos inexistentes.")
    elif op == "P":
        if len(contactos) != 0:
            nums = filterPartName(contactos, input("Escreva o que pretende pequisar: "))
            listContacts(nums)
        else:
            print("Contactos inexistentes.")
    elif op == "G":
        if len(contactos) != 0:
            gravarFicheiro(contactos)
        else:
            print("COntactos inexistentes.")
    else:
        print("Não implementado!")
