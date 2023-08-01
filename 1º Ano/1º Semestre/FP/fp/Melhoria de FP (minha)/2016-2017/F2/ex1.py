def ler(nomeFile):
    dic = {}
    try:
        fin = open(nomeFile, "r")
    except:
        print("Ficheiro Inválido!")
    else:
        for i in fin:
            i = i.rstrip().rsplit(",")
            if i[0] not in dic:
                dic[i[0]] = (i[1].strip(),i[2].strip(),i[3].strip(),i[4].strip())
    return dic
n = ler("p1.csv")
# print(n)
# if len(n) != 0:
#      for a in n:
#         print("{} --> {}".format(a, n[a]))

def classificar(tuploInfo):
    classificacaoA = 0.4
    classificacaoB = 0.4
    classificacaoC = 0.2
    if tuploInfo[0] == 'False':
        classTotal = 0
    else:
        if tuploInfo[1] == "-1":
            classificacaoA *= 0.95
        elif tuploInfo[1] == "0":
            classificacaoA = 0
        if tuploInfo[2] == "-1":
            classificacaoB *= 0.95
        if tuploInfo[3] == "-1":
            classificacaoC *= 0.95
        elif tuploInfo[3] == "0":
            classificacaoC = 0
        classTotal = classificacaoA + classificacaoB + classificacaoC
    return classTotal
# print(classificar(n['79981']))

def apurar():
    dic = {}
    while True:
        n = input("Ficheir (ENTER para terminar)? ")
        if not n:
            break
        else:
            fin = ler(n)
            valor = input("Valores? ")
            for i in fin:
                percentagem = classificar(fin[i])
                # print(percentagem)
                if i not in dic:
                    dic[i] = 0
                dic[i] += percentagem*int(valor)
    return dic

print(apurar())
