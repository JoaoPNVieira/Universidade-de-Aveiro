numero = input("Escreva um número inteiro: ")
length = len(numero) - 1
numeroFinal = ''

for i in range (length,  -1, -1):
    i = numero[length]
    length -= 1
    numeroFinal +=  i

print(numeroFinal)
