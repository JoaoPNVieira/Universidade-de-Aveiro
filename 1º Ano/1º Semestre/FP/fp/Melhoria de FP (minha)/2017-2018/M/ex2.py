def IMC(peso, altura):
    imc = peso/(altura**2)
    return imc

def classificacao(imc):
    if imc < 18.5:
        print("Baixo peso")
    elif 18.5 <= imc <= 25:
        print("Normal")
    else:
        print("Obesidade")
# classificacao(23.5)
# classificacao(27.9)
# classificacao(16.7)

def lerValorRealPositivo(msg):
    while True:
        n = input(msg)
        try:
            n = float(n)
        except:
            print("Número inválido!", end=" ")
        else:
            if n < 0:
                print("Número inválido!", end=" ")
            else:
                break
    return n
# lerValorRealPositivo("Peso? ")

def menu():
    while True:
        print("\nOpções disponíveis:")
        print("0 - sair")
        print("1 - introduzir uma nova medida")
        print("2 - mostrar média atual")
        op = input("Opção? ")
        if op not in ["0","1","2"]:
            print("Opção inválida!")
        else:
            break
    return op
# menu()

def main():
    count = 0
    imcTotal = 0
    while True:
        op = menu()
        if op == "0":
            print("FIM\nAté breve")
            break
        elif op == "1":
            peso = lerValorRealPositivo("Peso? ")
            altura = lerValorRealPositivo("Altura? ")
            imc = IMC(peso,altura)
            imcTotal += imc
            count += 1
            print("Adulto com um IMC de {:.1f}".format(imc))
            classificacao(imc)
        elif op == "2":
            print("Estatísticas atuais:")
            if imcTotal == 0 or count == 0:
                print("Ainda não foram efetuados cálculos!")
            else:
                print("Valor médio do IMC para {} adultos: {:.1f}".format(count, imcTotal/count))

main()
