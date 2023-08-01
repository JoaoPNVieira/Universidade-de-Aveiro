tel = ['938555182', '234567111', '776882333']

nome = ['Angelina', 'Brad', 'Claudia']


#   ALÍNEA A
print("\na)")

numero = input("Escreva um número de telemóvel: ")

def telemovel (numero, tel, nome):
    for i in range(0, len(tel)):
        if numero == tel[i]:
            x = nome[i]
            break
    else:
        x = numero
    return x

print("Contacto --> ", telemovel(numero, tel, nome))



#   ALÍNEA b
print("\nb)")

NOME = input("Escreva o nome do contacto que quer aceder: ")

def contacto (NOME, tel, nome):
    for i in range(0, len(nome)):
        if NOME.upper() in nome[i].upper():
            x = tel[i]
            break
    else:
        x = "No contact found"
    return x

print("Contacto --> ", contacto(NOME, tel, nome))
