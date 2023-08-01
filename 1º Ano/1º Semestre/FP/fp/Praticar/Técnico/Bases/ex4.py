sec = int(input("Escreva um número (inteiro e positivo) de segundos: "))

while sec <= 0:
    print("O número que introduziu não é válido.")
    print("     TENTE NOVAMENTE")
    sec = int(input("Escreva um número (inteiro e positivo) de segundos: "))

dias = sec / (24*3600)
horas = (dias - int(dias)) * 24
minutos = (horas - int(horas)) * 60
segundos = (minutos - int(minutos)) * 60

print("""O número de dias correspondente ao
número de segundos introduzidos é: {0:.0f}""".format(dias))
print("""O número de horas correspondente ao
número de segundos introduzidos é: {0:.0f}""".format(horas))
print("""O número de minutos correspondente ao
número de segundos introduzidos é: {0:.0f}""".format(minutos))
print("""O número de segundos correspondente ao
número de segundos introduzidos é: {0:.0f}""".format(segundos))
