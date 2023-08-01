def menu():
    print("\n1) Registar chamada")
    print("2) Ler ficheiro")
    print("3) Listar clientes")
    print("4) Fatura")
    print("5) Terminar")
    while True:
        n = input("0) Opção? ")
        if n not in ["1", "2", "3", "4", "5"]:
            print("Opção inválida!", end=" ")
        else:
            break
    return n

def validarNumTel(numTel):
    control = False
    if numTel[0] == "+":
        # print(numTel[1:])
        control = validarNumTel(numTel[1:])
    else:
        if numTel.isdigit():
            if len(numTel) >= 3:
                control = True
    return control

def lerFicheiro(lista):
    nome = input("Ficheiro? ")
    try:
        fin = open(nome, "r")
    except:
        print("Erro!")
    else:
        for i in fin:
            i = i.rstrip().rsplit()
            lista.append((i[0],i[1],i[2]))
        return lista

def main():
    registo = []
    while True:
        op = menu()
        if op == "5":
            print("FIM!")
            break
        elif op == "1":
            while True:
                telOrigem = input("Telefone origem? ")
                if validarNumTel(telOrigem) == True:
                    break
                else:
                    print("Número inválido!", end=" ")
            while True:
                telDestino = input("Telefone destino? ")
                if validarNumTel(telDestino) == True:
                    break
                else:
                    print("Número inválido!", end=" ")
            while True:
                dur = input("Duração (s)? ")
                if dur.isdigit():
                    if float(dur) > 0:
                        break
                else:
                    print("Valor inválido!", end=" ")
            registo.append((telOrigem, telDestino, dur))
        elif op == "2":
            lerFicheiro(registo)
            # print(registo)
        elif op == "3":
            if len(registo) != 0:
                listaClientes = []
                for i in registo:
                    if i[0] not in listaClientes:
                        listaClientes.append(i[0])
                listaClientes = sorted(listaClientes)
                print("Clientes:", end="  ")
                for i2 in listaClientes:
                    print(i2, end="  ")
                print("")
            else:
                print("Registos inexistentes!")

main()
