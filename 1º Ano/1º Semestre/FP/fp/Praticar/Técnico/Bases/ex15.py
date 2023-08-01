digito = input("Escreva um dígito: ")
numero = ""

while int(digito) != -1:
    numero += digito
    digito = input("Escreva um dígito: ")

print(numero)
