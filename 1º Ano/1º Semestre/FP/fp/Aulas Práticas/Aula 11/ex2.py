def menu():
    print("\n  <-- Menu -->\n")
    print("(1) Ordernar lista por nome, ordem crescente")
    print("(2) Ordernar lista por nome, ordem decrescente")
    print("(3) Ordernar lista por nMec, ordem crescente")
    print("(4) Ordernar lista por nMec, ordem decrescente")
    print("(5) Ordernar lista por turma, ordem crescente")
    print("(6) Ordernar lista por turma, ordem decrescente")
    print("(7) Ordernar lista por nota API, ordem crescente")
    print("(8) Ordernar lista por nota API, ordem decrescente")
    print("(9) Ordernar lista por nota ATP, ordem crescente")
    print("(10) Ordernar lista por nota ATP, ordem decrescente")
    print("(99) Terminar")
    while True:
        op = input("Insira a opção pretendida: ")
        if op in ["99", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]:
            break
        else:
            print("Opção inválida")
    return op

def readFile():
    fin = open("fp.csv", "r")
    newList = []
    for student in fin:
        student = student.rstrip().rsplit(",")
        if student[0].isdigit():
            newList.append(student)
    return newList

def imprimir(notas):
    print("{:^7s}|{:^50s}|{:^6s}|{:^6s}|{:^6s}".format("NMec", "Nome", "Turma", "API", "ATP"))
    for i in notas:
        print("{:^7s}|{:^50s}|{:^6s}|{:^6s}|{:^6s}".format(i[0], i[1], i[2], i[3], i[4]))

def main():
    notasFile = readFile()
    #imprimir(notasFile)
    while True:
        op = menu()
        if op == "99":
            print("FIM")
            break
        elif op == "1":
            a = sorted(notasFile, key=lambda x: x[1])
            imprimir(a)
        elif op == "2":
            a = sorted(notasFile, key=lambda x: x[1], reverse=True)
            imprimir(a)
        elif op == "3":
            a = sorted(notasFile, key=lambda x: x[0])
            imprimir(a)
        elif op == "4":
            a = sorted(notasFile, key=lambda x: x[0], reverse=True)
            imprimir(a)
        elif op == "5":
            a = sorted(notasFile, key=lambda x: x[2])
            imprimir(a)
        elif op == "6":
            b = sorted(notasFile, key=lambda x: x[2], reverse=True)
            imprimir(b)
        elif op == "7":
            a = sorted(notasFile, key=lambda x: x[3])
            imprimir(a)
        elif op == "8":
            b = sorted(notasFile, key=lambda x: x[3], reverse=True)
            imprimir(b)
        elif op == "9":
            a = sorted(notasFile, key=lambda x: x[4])
            imprimir(a)
        elif op == "10":
            b = sorted(notasFile, key=lambda x: x[4], reverse=True)
            imprimir(b)




main()
