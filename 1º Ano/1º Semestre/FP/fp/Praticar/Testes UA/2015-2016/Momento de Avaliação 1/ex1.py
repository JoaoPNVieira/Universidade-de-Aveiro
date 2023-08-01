def voto():
    print("1 - Democratas")
    print("2 - Republicanos")
    print("3 - Liberais")
    print("0 - Branco")
    while True:
        v = input("Digite o n.º correspondente ao seu voto: ")
        if v in ["0", "1", "2", "3"]:
            break
        else:
            print("Voto Inválido.")
    return v

def verifica(msg):
    eleitores = []
    numeroE = input(msg)
    value = False
    fin = open("caderno.txt", "r")
    for i in fin:
        i = i.rstrip().rsplit(",")
        eleitores.append(i[0])
        if i[0] == str(numeroE):
            value = True
    return (value, numeroE, eleitores)

def contagem(dicVotos, eleitoresLista):
    totalEleitores = len(eleitoresLista)
    totaVotos = dicVotos["1"] + dicVotos["2"] + dicVotos["3"] + dicVotos["0"]
    abstencao = totalEleitores - totaVotos
    print("Democratas: {} votos ({:.1f}%)".format(dicVotos["1"], (dicVotos["1"]/totaVotos)*100))
    print("Republianos: {} votos ({:.1f}%)".format(dicVotos["2"], (dicVotos["2"]/totaVotos)*100))
    print("Liberais: {} votos ({:.1f}%)".format(dicVotos["3"], (dicVotos["3"]/totaVotos)*100))
    print("Brancos: {} votos".format(dicVotos["0"]))
    print("Abstenção: {} ({:.1f}%)".format(abstencao, (abstencao/totalEleitores)*100))


def main():
    contagemDeVotos = {"0": 0, "1": 0, "2": 0, "3": 0}
    while True:
        numEleitor = verifica("Introduza o seu número de eleitor: ")
        if numEleitor[0]:
            votoRealizado = voto()
            contagemDeVotos[votoRealizado] += 1

        elif numEleitor[1].lower() == "fim":
            break
        else:
            print("O número de eleitor introduzido não se encontra no caderno eleitoral.")
    contagem(contagemDeVotos, numEleitor[2])
main()
