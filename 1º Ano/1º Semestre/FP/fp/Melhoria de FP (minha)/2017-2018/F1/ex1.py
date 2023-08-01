def lerFicheiro(fname, veiculos, clientes):
    try:
        fin = open(fname, "r")
    except:
        print("Ficheiro inválido/inexistente!")
    else:
        for i in fin:
            i = i.rstrip().split(";")
            if i[0] not in veiculos:
                veiculos[i[0]] = (i[1],i[2])
            if i[2] not in clientes:
                clientes[i[2]] = []
            clientes[i[2]].append(i[0])
        fin.close()
# veiculos = {}
# clientes = {}
# lerFicheiro("ep1.csv", veiculos, clientes)
# print(clientes)
# for i in veiculos:
#     print(i,veiculos[i])

def imprimirVeiculosOrdenados(veiculos):
    matriculasOrdenadas = sorted(veiculos, key=lambda x: (veiculos[x][1], x))
    for i in matriculasOrdenadas:
        print("{} : ('{}','{}')".format(veiculos[i][1], i, veiculos[i][0]))
# imprimirVeiculosOrdenados(veiculos)

def imprimirVeiculosOrdenadosNIF(clientes):
    for i in clientes:
        print("{} : {}".format(i, clientes[i]))
# imprimirVeiculosOrdenadosNIF(clientes)

def validarMatricula(string):
    control = False
    stringList = string.rstrip().split("-")
    if len(stringList) == 3:
        if len(stringList[0]) == len(stringList[1]) == len(stringList[2]) == 2 and stringList[0].isdigit() and stringList[2].isdigit() and stringList[1].isalpha() and stringList[1].isupper():
            control = True
    return control
# print(validarMatricula("00-AA-00"))

def validarValorInteiroPositivo(msg):
    while True:
        num = input(msg)
        if num.isdigit() and int(num) > 0:
            break
        else:
            print("Invalida!", end=" ")
    return num

def addEstacionamento(estacionamentos):
    while True:
        mat = input("Matricula? ")
        if validarMatricula(mat) == True:
            break
        else:
            print("Invalida!", end=" ")
    dur = validarValorInteiroPositivo("Duracao? ")
    if mat not in estacionamentos:
        estacionamentos[mat] = []
    estacionamentos[mat].append(dur)

def gravarFicheiro(estacionamentos):
    lista = []
    for i in estacionamentos:
        for b in estacionamentos[i]:
            lista.append((b,i))
    listaS = sorted(lista, key=lambda x: int(x[0]), reverse=True)
    fin = open("parque.csv", "w")
    for c in listaS:
        fin.write("{};{}\n".format(c[0], c[1]))
    fin.close()

def fatura(veiculos, clientes, estacionamentos):
    while True:
        nif = input("NIF? ")
        if nif in clientes:
            break
        else:
            print("NIF inexistente!", end=" ")
    total = 0
    print("Fatura NIF: {}".format(nif))
    print("{:11s} {:11s} {:>11s} {:>8s}".format("Matricula", "Marca", "Duracao", "Custo"))
    for i in clientes[nif]:
        if i in estacionamentos:
            for d in estacionamentos[i]:
                custo = int(d)*0.01
                total += custo
                print("{:11s} {:11s} {:>11s} {:>8.2f}".format(i, veiculos[i][0], d, custo))
    print("{:11s} {:11s} {:>11s} {:>8.2f}".format("Total:", "", "", total))

def menu():
    print("\nOpcoes disponiveis:")
    print("0 - Terminar")
    print("1 - Ler ficheiro de clientes")
    print("2 - Imprimir clientes ordenados")
    print("3 - Mostrar matriculas por Cliente")
    print("4 - Adicionar acesso ao parque")
    print("5 - Gravar fatura para um cliente")
    print("6 - Gerar fatura para um cliente")
    while True:
        op = input("Opcao? ")
        if op not in ["0", "1", "2", "3", "4", "5", "6"]:
            print("Opcao invalida!", end=" ")
        else:
            break
    return op

def main():
    veiculos = {}
    clientes = {}
    estacionamentos = {}
    while True:
        op = menu()
        if op == "0":
            print("Obrigado por usar software desenvolvido em FP!")
            break
        elif op == "1":
            lerFicheiro(input("Nome do ficheiro? "), veiculos, clientes)
            if len(veiculos) != 0:
                print("Foram importados {} registos.".format(len(veiculos)))
        elif op == "2":
            if len(veiculos) != 0:
                imprimirVeiculosOrdenados(veiculos)
            else:
                print("Não existem registos.")
        elif op == "3":
            if len(clientes) != 0:
                imprimirVeiculosOrdenadosNIF(clientes)
            else:
                print("Não existem clientes!")
        elif op == "4":
            addEstacionamento(estacionamentos)
        elif op == "5":
            if len(estacionamentos) != 0:
                gravarFicheiro(estacionamentos)
                print("Ficheiro gravado com sucesso!")
            else:
                print("Não existem entradas no Parque!")
        elif op == "6":
            if len(clientes) != 0 and len(estacionamentos) != 0 and len(veiculos) != 0:
                fatura(veiculos, clientes, estacionamentos)
            else:
                print("Dados insuficientes para criar fatura!")

main()
