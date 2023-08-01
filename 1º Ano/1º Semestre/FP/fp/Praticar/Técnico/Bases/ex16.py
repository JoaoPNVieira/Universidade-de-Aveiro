numero = input("Escreva um número: ")
length = len(numero) - 1
capicua = numero

for i in range (length,  -1, -1):
    i = numero[length]
    length -= 1
    capicua +=  i

print(capicua)
