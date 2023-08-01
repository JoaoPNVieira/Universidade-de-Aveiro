def deSeuNomeContida (palavra):
    fin = open("dicionario.txt")
    for i in fin:
        if palavra != i.rstrip() and palavra in i.rstrip():
            return palavra

ficheiro = open("dicionario.txt")
listaDePalavras = []
for i in ficheiro:
    y = deSeuNomeContida(i.rstrip())
    if y != None:
        listaDePalavras.append(y)

for i in range(len(listaDePalavras)):
    print(listaDePalavras[i])
