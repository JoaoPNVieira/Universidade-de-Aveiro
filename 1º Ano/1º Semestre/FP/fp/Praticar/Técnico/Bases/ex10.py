numero = input("Escreva um número inteiro: ")
numeroFinal = ''
for i in numero:
    if int(i) % 2 != 0:
        numeroFinal += i

print(numeroFinal)
