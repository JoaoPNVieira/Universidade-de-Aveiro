num1 = int(input("Escreva um número inteiro: "))
num2 = int(input("Escreva outro número inteiro: "))

def sum(a, b):
    sum = 0
    if a < b:
        r = range (a, b+1)

    else:
        r = range (b, a+1)

    for number in r:
        sum += number
    return sum

print("""A soma de todos os números inteiros compreendidos entre
os dois número que introduziu (inclusive) é: """, sum(num1, num2))
