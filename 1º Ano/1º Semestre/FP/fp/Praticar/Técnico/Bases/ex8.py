sec = int(input("Escreva um número (inteiro e positivo) de segundos: "))

while sec >= 0:
    dias = sec / (24*3600)
    print("""O número de dias correspondente ao
    número de segundos introduzidos é: {0:.2f}""".format(dias))
    sec = int(input("Escreva outro número (inteiro e positivo) de segundos: "))
