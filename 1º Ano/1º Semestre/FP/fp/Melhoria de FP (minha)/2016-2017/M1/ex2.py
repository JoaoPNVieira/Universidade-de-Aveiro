def contida(palavra):
    control = False
    fin = open("dicionario.txt", "r")
    for i in fin:
        i = i.rstrip()
        if palavra in i and palavra != i:
            control = True
    return control


fin2 = open("dicionario.txt", "r")
wordsList = []
for i in fin2:
    i = i.rstrip()
    ver = contida(i)
    if ver == True:
        if i not in wordsList:
            wordsList.append(i)

for word in wordsList:
    print(word)
