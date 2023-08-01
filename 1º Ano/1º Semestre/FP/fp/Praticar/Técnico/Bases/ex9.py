digito = input("Escreva um dígito (-1 para terminar): \n")
numero = ''

while int(digito) != -1:
    numero += digito
    digito = input("Escreva um dígito (-1 para terminar): \n")

print(numero)
