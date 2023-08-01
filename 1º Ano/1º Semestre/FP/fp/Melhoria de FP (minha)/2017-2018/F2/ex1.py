def lerFicheiro(fname):
    veiculos = {}
    marcas = {}
    try:
        fin = open(str(fname), "r")
    except:
        print("Ficheiro inválido!")
    else:
        for i in fin:
            i = i.rstrip().split(";")
            if i[0] not in veiculos:
                veiculos[i[0]] = (i[1],i[2])
            if i[1] not in marcas:
                marcas[i[1]] = []
            marcas[i[1]].append(i[0])
    print (veiculos)
    print (marcas)
    return (veiculos,marcas)
# n = lerFicheiro("ep2.csv")
# for i in n:
#     print(i,n[i])

def imprimirVeiculosOrdenados(veiculos):
    lista = sorted(veiculos, key=lambda x: (veiculos[x][1], x))
    for i in lista:
        print(veiculos[i][1], ': (', i, ', ',veiculos[i][0],')')
# veiculos = lerFicheiro("ep2.csv")[0]
# imprimirVeiculosOrdenados(veiculos)

def imprimirVeiculosMarca(marcas):
    for i in marcas:
        print("{} : {}".format(i,marcas[i]))
# marcas = lerFicheiro("ep2.csv")[1]
# imprimirVeiculosMarca(marcas)

def validarTempo(string):
    control = False
    if ":" in string:
        stringList = string.rstrip().split(":")
        # print(stringList[0])
        if len(stringList) == 2:
            if stringList[0].isdigit() and stringList[1].isdigit():
                if 0 <= int(stringList[0]) <= 23 and 0 <= int(stringList[1]) <= 59:
                    control = True
    return control
# print(validarTempo("1:59"))

def adicionarServico(viagens):
    mat = input("Matrícula? ")
    numCond = input("Numero do condutor? ")
    while True:
        tempo = input("Duracao? ")
        if validarTempo(tempo) == True:
            break
        else:
            print("Invalida!", end=" ")
    if numCond not in viagens:
        viagens[numCond] = []
    viagens[numCond].append((mat,tempo))
# viagens = {}
# viagem(viagens)
# print(viagens)

def gravarFicheiro(viagens):
    numCondList = sorted(viagens, key=lambda x: x, reverse=True)
    fin = open("viagens.csv", "w")
    for a in numCondList:
        for b in viagens[a]:
            fin.write("{};{};{}\n".format(a,b[0],b[1]))
    fin.close()
# viagens = {"100": [("00-AA-00","1:23")], "200": [("00-AA-00","1:23"),("11-BB-00","2:23")]}
# gravarFicheiro("viagens.csv", viagens)

def fatura(viagens, veiculos):
    while True:
        num = input("Condutor? ")
        if num in viagens:
            break
        else:
            print("Número de condutor inexistente!", end=" ")
    print("Folha pagamento para o condutor: {}".format(num))
    total = 0
    print("{:10s} {:11s} {:>11s} {:>8s} {:>9s}".format("Matricula", "Marca", "Classe", "Duracao", "Valor"))
    for i in viagens[num]:
        if i[0] in veiculos:
            tmList = i[1].split(":")
            tempo = float(tmList[0])+float(tmList[1])/60
            if veiculos[i[0]][1] == "A":
                custo = 5*tempo
            elif veiculos[i[0]][1] == "B":
                custo = 10*tempo
            elif veiculos[i[0]][1] == "C":
                custo = 20*tempo
            total += custo
            print("{:10s} {:11s} {:>11s} {:>8s} {:>9.1f}".format(i[0], veiculos[i[0]][0], veiculos[i[0]][1], i[1], custo))
    print("{:10s} {:11s} {:>11s} {:>8s} {:>9.1f}".format("Total:", "", "", "", total))

def menu():
    print("\nOpcoes disponiveis:")
    print("T - Terminar")
    print("L - Ler ficheiro de viaturas")
    print("I - Imprimir viaturas ordenadas")
    print("M - Mostrar matriculas associadas a cada marca")
    print("A - Adicionar novo servico")
    print("G - Gravar servicos efetuados")
    print("P - Pagamento para um condutor")
    while True:
        op = input("Opcao? ")
        if op.upper() not in ["T", "L", "I", "M", "A", "G", "P"]:
            print("Opcao invalida!", end=" ")
        else:
            break
    return op.upper()

def main():
    viagens = {}
    viaturas = {}
    marcas = {}
    while True:
        op = menu()
        if op == "T":
            print("Obrigado por usar software desenvolvido em FP!")
            break
        elif op == "L":
            n = lerFicheiro(input("Nome do ficheiro? "))
            viaturas = n[0]
            marcas = n[1]
            if len(viaturas) != 0:
                print("Foram importadas {} viaturas".format(len(viaturas)))
        elif op == "I":
            if len(viaturas) == 0:
                print("Não existem viaturas!")
            else:
                imprimirVeiculosOrdenados(viaturas)
        elif op == "M":
            if len(marcas) == 0:
                print("Não existem viaturas!")
            else:
                imprimirVeiculosMarca(marcas)
        elif op == "A":
            adicionarServico(viagens)
        elif op == "G":
            if len(viagens) == 0:
                print("Não existem serviços para registar.")
            else:
                gravarFicheiro(viagens)
                print("Ficheiro gravado com sucesso!")
        elif op == "P":
            if len(viagens) == 0:
                print("Não existem serviços para faturar.")
            else:
                fatura(viagens, viaturas)

main()
