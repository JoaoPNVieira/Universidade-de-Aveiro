def lerFicheiro():
    try:
        n = input("Insira o nome do ficheiro: ")
        fin = open(n, "r")
    except:
        print("Ficheiro inválido!")
        lerFicheiro()
# jajsjsj
    else:  #1234
        for i in fin:
            i = i.rstrip()
            for c in range(len(i)):
                if i[c] == "#":
                    i = i[:c]
                    break #1121ad
            print(i.rstrip())
                #1234rd
lerFicheiro()
