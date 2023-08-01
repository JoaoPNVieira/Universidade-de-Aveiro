def segredo():
    import random
    n = random.randint(1000,9999)
    return str(n)
# print(segredo())

def valida(msg):
    while True:
        num = input(msg)
        if num.isdigit() and len(num) == 4:
            break
        else:
            print("Use 4 algarismos!")
    return num
# valida("Tentativa? ")

def pontuacao(segredo, tentativa):
    certosPosCerta = 0
    certosAbs = 0
    for i in range(4):
        if segredo[i] == tentativa[i]:
            certosPosCerta += 1
        if tentativa[i] in segredo:
                certosAbs += 1
    certosPosErrada = certosAbs - certosPosCerta
    return(certosPosCerta, certosPosErrada)

def pontos(certoPosCerta,certoPosErrada):
    pontuacao = 10*certoPosCerta + certoPosErrada
    return pontuacao

def escrever(total):
    try:
        fin = open("recorde.txt", "r")
    except:
        print("Erro inesperado!")
    else:
        for i in fin:
            i = i.rstrip().rsplit(",")
        fin.close()
        fin2 = open("recorde.txt", "w")
        if int(i[1]) < total:
            nome = input("Novo recorde! Nome? ")
            fin2.write("{}, {}".format(nome, total))

def jogo():
    print("Adivinhe o segredo de 4 algarismos.")
    pontosTotal = 0
    # secret = segredo()
    secret = "3989"
    print("(SEGREDO: {})".format(secret))
    for i in range(1,11):
        tent = valida("Tentativa {}? ".format(i))
        certos = pontuacao(secret, tent)
        ponto = pontos(certos[0], certos[1])
        pontosTotal += ponto
        print("{} certas, {} no lugar errado, {} ponto(s), total: {} ponto(s)".format(certos[0], certos[1], ponto, pontosTotal))
        if certos[0] == 4:
            print("Conseguiu em {} tentativa(s).".format(i))
            if i < 10:
                pontosTotal += (10-i)*100
            print("Total: {} pontos".format(pontosTotal))
            break
    escrever(pontosTotal)

jogo()
