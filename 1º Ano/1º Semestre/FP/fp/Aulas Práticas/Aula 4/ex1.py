number = float(input("Escreva um número real: "))
count = 0
soma = 0
minimo = number
maximo = number

while number!=0:
    count = count + 1
    soma = soma + number
    if minimo > number:
        minimo = number
    if maximo < number:
        maximo = number
    number = float(input("Escreva outro número real: "))

if count!=0:
    media = soma / count

else:
    media = 0

print("Introduziu ", count, " números.")
print("A média dos valores que introduziu é ", media)
print("O valor máximo que introduziu foi: ", maximo)
print("O valor mínimo que introduziu foi:", minimo)
