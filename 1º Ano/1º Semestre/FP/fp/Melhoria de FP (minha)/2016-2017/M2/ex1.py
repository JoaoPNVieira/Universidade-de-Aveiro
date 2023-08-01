def menu():
    print()
    print("(L)er ficheiro")
    print("(A)purados")
    print("(P)aíses")
    print("(E)liminatórias")
    print("(S)air")
    while True:
        op = input(">")
        if op.upper() not in ["L", "A", "P", "E", "S"]:
            print("Opção inválida!", end=" ")
        else:
            break
    return op.upper()

def ler_tempos(nome_ficheiro):
    dic = {}
    try:
        fin = open(str(nome_ficheiro), "r")
    except:
        print("FIcheiro inexistente.")
    else:
        for i in fin:
            i = i.rstrip().rsplit(",")
            if i[4] not in dic:
                dic[i[4]] = []
            dic[i[4]].append((i[0],i[1],i[2],i[5]))
    return dic



def main():
    while True:
        op = menu()
        if op == "S":
            break

main()
