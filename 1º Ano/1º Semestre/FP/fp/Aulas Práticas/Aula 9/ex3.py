# Complete este programa como pedido no guião da aula.
#import csv
contactosDict = {}

def listContacts(contactos):
    try:
        n = input("Escreva o nome do ficheiro que pretende abrir: ")
        dic = open(n, 'r')
        """Print the contents of the dictionary as a table, one item per row."""
        print("{:>12s} : {}".format("Numero", "Nome"))
        for row in dic:
            row = row.rstrip().rsplit(",")
            contactos[row[0]] = row[1]
        for l in contactos:
            print("{:>12s} : {}".format(l, contactos[l]))
        dic.close()
    except:
        print("The file doesn't exist in this directory")

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

def addContact(contactos):
    try:
        n = input("Escreva o nome do ficheiro em que quer guardar a info: ")
        num = input("Escreva o número que deseja adicionar: ")
        nome = input("Escreva o nome correspondente ao número: ")
        if num in contactos:
            x = input("O número já existe. Pretende alterar? (Y/N)")
            if x.upper() == "Y":
                contactos[num] = nome
        else:
            contactos[num] = nome
        dic = open(n, 'w')
        for l in contactos:
            entrada = str(l)+ "," + str(contactos[l]) + "\n"
            dic.write(entrada)
        dic.close()
    except:
        print("Somethind went wrong. Try again.")

def removeContact(contactos):
    try:
        n = input("Escreva o nome do ficheiro em que quer guardar a info: ")
        num = input("Escreva o número que deseja remover: ")
        if num in contactos:
            del contactos[num]
            dic = open(n, 'w')
            for l in contactos:
                entrada = str(l)+ "," + str(contactos[l]) + "\n"
                dic.write(entrada)
            dic.close()

        else:
            print("O contacto não existe")
    except:
        print("Somethind went wrong. Try again.")

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

op = ""
while op != "T":
    op = menu()
    if op == "T":
        print("Fim")
    elif op == "L":
        print("Contactos:")
        listContacts(contactosDict)
    elif op == "A":
        addContact(contactosDict)
    elif op == "R":
        removeContact(contactosDict)
    elif op == "N":
        number = input("Escreva o número que deseja procurar: ")
        print(numberToName(contactosDict, number))

    else:
        print("Não implementado!")
