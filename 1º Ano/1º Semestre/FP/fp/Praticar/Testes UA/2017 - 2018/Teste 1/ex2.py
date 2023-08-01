# Nome: Vasco António Lopes Ramos
# Número mecanográfico: 88931

# a) cálculo do IMC do utilizador
def IMC (peso, altura):
    imc = peso/(altura)**2
    print("O adulto tem um IMC de {0:.1f}".format(imc))
    return imc


# b) apresentada da mensagem com a classificação
def classificacao (imc):
    if imc < 18.5:
        print("Baixo peso\n")
    elif 18.5 <= imc <= 25:
        print("Normal\n")
    else:
        print("Obesidade\n")


# c) validação dos valores de peso e altura
def lerValorRealPositivo (msg):
    while True:
        n = float(input(msg))
        if n < 0:
            print("Número inválido!", end=" ")
        else:
            break
    return n


# d) representação do menu
def menu():
    print("Opções disponíveis:")
    print("0 - sair")
    print("1 - introduzir nova medida")
    print("2 - mostrar média atual")
    opcao = int(input("Opção? "))
    return opcao


# e) main
print("\n\nBem vindo(a) à calculadora do IMC\n\n")
contagem = 0
soma = 0
while True:
    op = menu()
    if op == 0:
        print("\nFIM\nAté breve")
        break

    elif op < 0 or op > 2:
        print("Opção Inválida!\n")

    elif op == 1:
        peso = lerValorRealPositivo("Peso (kg)? ")
        altura = lerValorRealPositivo("Altura (m)? ")
        imc = IMC(peso, altura)
        classificacao(imc)
        contagem += 1
        soma += imc

    elif op == 2:
        print("Estatísticas atuais:")
        if contagem == 0:
            print("Ainda não foram efetuados cálculos!\n")
        else:
            print("Valor médio do IMC para",contagem,"adulto(s): {0:.1f}\n".format(soma/contagem))
