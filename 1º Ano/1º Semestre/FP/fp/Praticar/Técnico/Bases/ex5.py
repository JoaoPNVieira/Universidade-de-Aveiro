from math import sqrt

x1 = float(input("Escreva um número real: "))
x2 = float(input("Escreva outro número real: "))
x3 = float(input("Escreva outro número real: "))
x4 = float(input("Escreva outro número real: "))
x5 = float(input("Escreva outro número real: "))

media = (x1 + x2 + x3 + x4 + x5) / 5

desvioPadrao = sqrt((1/4) * ((x1-media)**2 + (x2-media)**2 + (x3-media)**2 + (x4-media)**2 + (x5-media)**2))

print("A média é:", media)
print("O desvio padrão é:", desvioPadrao)
