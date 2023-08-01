number = float(input("Escreva um número real: "))
elements = 0
soma = 0
minimo = number
maximo = number

while number != 0:
    #Numero de elementos introduzidos
    elements += 1

    #Soma dos elementos introduzidos
    soma += number

    #Minimo
    if minimo > number:
        minimo = number

    #Máximo
    if maximo < number:
        maximo = number

    number = float(input("Escreva outro número real: "))

if elements != 0:
    media = soma / elements

else:
    media = 0

print("Número de elementos introduzidos: ", elements)
print("Média dos elementos introduzidos: ", media)
print("O valor máximo que introduziu foi: ", maximo)
print("O valor mínimo que introduziu foi:", minimo)
