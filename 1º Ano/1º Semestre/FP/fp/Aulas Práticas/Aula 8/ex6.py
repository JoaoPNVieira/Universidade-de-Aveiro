def criarMatriz():
    m = int(input("Número de linhas: "))
    n = int(input("Número de colunas: "))
    matriz = {}
    for i in range(m):
        for j in range(n):
            val = input("Escreva o valor que pretende para a entrada ({},{}): ".format(i,j))
            matriz[(i,j)] = val
    return (matriz, m, n)

def imprimirMatriz(mt):
    for i in range(mt[1]):
        for j in range(mt[2]):
            print(mt[0][(i,j)], end="   ")
        print("\n")

def somarMatrizes(m1, m2):
    m3 = {}
    if m1[1] == m2[1] and m1[2] == m2[2]:
        for i in range(m1[1]):
            for j in range(m1[2]):
                m3[(i,j)] = int(m1[0][(i,j)]) + int(m2[0][(i,j)])
        return (m3, m1[1], m1[2])
    else:
        print("Impossível calcular soma das matrizes introduzidas.")


def menu():
    while True:
        print("\n\nMenu:\n")
        print("1-  Inserir Matriz")
        print("2 - Somar Matrizes ")
        print("T - Terminar")
        op = input("Opção? ")
        if op.upper() in ["1", "2", "T"]:
            break
    return op.upper()

def main():
    m1 = 0
    m2 = 0
    while True:
        op = menu()
        if op == "T":
            print("Fim!")
            break
        elif op == "1":
            m1 = criarMatriz()
            print("\n")
            m2 = criarMatriz()
        elif op == "2":
            if m1 == 0 and m2 == 0:
                print("Ainda não introduziu nenhuma matriz.\n")
            else:
                m3 = somarMatrizes(m1, m2)
                imprimirMatriz(m3)


main()
