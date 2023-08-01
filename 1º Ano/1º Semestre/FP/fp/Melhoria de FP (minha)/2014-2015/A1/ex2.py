def codifica(frase, chave):
    original = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    fraseNova = ""
    for i in frase:
        if i == " ":
            fraseNova += " "
        else:
            indice = original.find(i.upper())
            fraseNova += chave[indice]
    return fraseNova

def descodifica(frase, chave):
    original = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    fraseNova = ""
    for i in frase:
        if i == " ":
            fraseNova += " "
        else:
            indice = chave.find(i.upper())
            fraseNova += original[indice]
    return fraseNova

# print(codifica("Aveiro","DEFGHIJKLMNOPQRSTUVWXYZABC"))
# print(descodifica("Dyhlur","DEFGHIJKLMNOPQRSTUVWXYZABC"))

def validar(frase):
    control = False
    for i in frase:
        if i.isalpha() or i == " ":
            control = True
        else:
            control = False
            break
    return control

def menu():
    print("1- Cifrar")
    print("2- Descifrar")
    print("0- Sair do porgrama")
    while True:
        op = input("Opção? ")
        if op in ["1", "2", "0"]:
            break
        else:
            print("Opção inválida.", end=" ")
    return op

chave = input("Introduza a chave: ")
while True:
    op = menu()
    if op == "0":
        print("FIM!")
        break
    elif op == "1":
        while True:
            frase = input("Escreva a frase a codificar: ")
            control = validar(frase)
            if control == True:
                break
        print(codifica(frase, chave))
    elif op == "2":
        while True:
            frase = input("Escreva a frase a descodificar: ")
            control = validar(frase)
            if control == True:
                break
        print(descodifica(frase, chave))
