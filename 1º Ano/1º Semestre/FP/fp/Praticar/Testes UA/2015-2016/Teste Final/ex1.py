from random import randint

def segredo():
    codigo = randint(1000,9999)
    print("(SEGREDO: {})".format(codigo))
    return str(codigo)


def valida(msg):
    while True:
        tentativa = input(msg)
        if tentativa.isdigit() == True and len(tentativa) == 4:
            return tentativa
            break
        else:
            print("Use 4 algarismos!")

def pontuacao(segredo, tentativa):
    certoPosCerta = 0
    certoPosErrada = 0
    certos = 0
    for i in range(0,4):
        if segredo[i] == tentativa[i]:
            certoPosCerta += 1

    for d in tentativa:
        if d in segredo:
            certos += 1

    certoPosErrada = certos - certoPosCerta
    return (certoPosCerta, certoPosErrada)

def pontos(certoPosCerta, certoPosErrada, total):
    ptsCertosPosCerta = 10*certoPosCerta
    ptsCertosPosErrado = 1*certoPosErrada
    ptsTotal = ptsCertosPosCerta + ptsCertosPosErrado + total
    return (ptsCertosPosCerta, ptsCertosPosErrado, ptsTotal)

def jogo():
    codigo = segredo()
    numTentativas = 1
    tentativa = "0"
    totalPontos = 0
    while True:
        if numTentativas > 10 or tentativa == codigo:
            break
        else:
            tentativa = valida("Tentativa {}? ".format(numTentativas))
            certosEerrados = pontuacao(codigo, tentativa)
            score = pontos(certosEerrados[0], certosEerrados[1], totalPontos)
            totalPontos = score[2]
            print("{} certas, {} no lugar errado, {} pontos, total: {} pontos".format(certosEerrados[0], certosEerrados[1], score[0]+score[1], totalPontos))
            numTentativas += 1

    if numTentativas-1 < 10:
        totalPontos += (11 - numTentativas)*100
    print("Conseguiu em {} tentativas.".format(numTentativas-1))
    print("Total: {} pontos".format(totalPontos))
    return totalPontos


def escrever(pontuacao):
    fin = open("recorde.txt" , "r")
    for i in fin:
        recorde = i.rstrip().rsplit(",")
    fin.close()
    if pontuacao > int(recorde[1]):
        print("Novo recorde!", end=" ")
        nome = input("Nome? ")
        fin2 = open("recorde.txt", "w")
        entrada = nome + "," + str(pontuacao) + "\n"
        fin2.write(entrada)
        fin2.close()

total = jogo()
escrever(total)
