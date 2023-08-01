#a) menu
def menu():
    print("\n<---MENU--->\n")
    print("1) Registar chamada")
    print("2) Ler ficheiro")
    print("3) Listar clientes")
    print("4) Fatura")
    print("5) Terminar")
    opcao = int(input("0) Opção? "))
    return opcao


#b) função para validar nº telefone
def validacao(msg):
    while True:
        numero = input(msg)
        count = 0
        if numero[0] == "+":
            newNumero = numero[1:]
            for digito1 in newNumero:
                if 0 < int(digito1) < 9:
                    count +=1
            if count >= 3:
                return newNumero
                break
            else:
                print("Número Inválido!", end=" ")
        else:
            for digito2 in numero:
                if 0 < int(digito2) < 9:
                    count +=1
            if count >= 3:
                return numero
                break
            else:
                print("Número Inválido!", end=" ")

#d) função para ler ficheiro ficheiro
def readFile(msg, chamadasList):
    ficheiro = input(msg)
    fin = open(ficheiro, 'r')
    for i in fin:
        entrada = i.rstrip().rsplit()
        if entrada[0] not in chamadas:
            chamadas[entrada[0]] = []
        chamadas[entrada[0]].append(tuple([entrada[1], entrada[2]]))
    fin.close()

#f1) função para calcular custo:
def custoChamada(clientNumber, secondNumber, time):
    cost = 0
    time = float(time)/60
    if secondNumber[0] == "2":
        cost = 0.02*float(time)
    elif secondNumber[0] == "+":
        cost = 0.80*(float(time))
    elif clientNumber[0:2] == secondNumber[0:2]:
        cost = 0.04*(float(time))
    else:
        cost = 0.10*float(time)
    return cost


#f2) função para apresentar a fatura detalhada
def fatura(clientNumber, chamadasList):
    totalCost = 0
    print("Fatura do cliente ", clientNumber)
    print("{:<20s} {:>8s} {:>10s}".format("Destino", "Duração", "Custo"))
    clientData = chamadasList[clientNumber]
    for call in clientData:
        custo = custoChamada(clientNumber, call[0], call[1])
        totalCost += custo
        print("{:<20s} {:>8s} {:>10.2f}".format(call[0], call[1], custo))
    print("{:<20s} {:>8s} {:>10.2f}".format("", "Total:", totalCost))

#main
chamadas = {}
while True:
    op = menu()
    if op == 1:
        telOrigem = validacao("Telefone origem? ")
        telDestino = validacao("Telefone destino? ")
        dur = int(input("Duração (s)? "))
        if telOrigem not in chamadas:
            chamadas[telOrigem] = []
        chamadas[telOrigem].append(tuple([telDestino, dur]))
    elif op == 2:
        readFile("Ficheiro? ", chamadas)
        # print(chamadas)
    elif op == 3:
        clients = sorted(chamadas)
        print("Clients:  " , end="")
        for i in clients:
            print(i, end=", ")
    elif op == 4:
        client = input("Cliente? ")
        fatura(client, chamadas)
    elif op == 5:
        break
