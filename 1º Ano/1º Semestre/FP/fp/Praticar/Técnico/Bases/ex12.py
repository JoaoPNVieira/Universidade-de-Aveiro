from math import factorial
x = int(input("Escreva um valor para x: "))
n = int(input("Escreva um valor para n: "))
soma = 0

for i in range(0, n+1):
    if i == 0:
        number = 1
    elif i == 1:
        number = x
    else:
        number = (x**i)/factorial(i)
    soma += number

print(soma)
