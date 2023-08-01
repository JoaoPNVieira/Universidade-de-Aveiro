n = input("Escreva uma sucessão de caracteres: ")
length = len(n)

def codifica(n):
    nPar = ""
    nImpar = ""
    for i in range(0, length):
        if i % 2 == 0:
            nPar += n[i]
        else:
            nImpar += n[i]
    print(nPar + nImpar)

codifica(n)
