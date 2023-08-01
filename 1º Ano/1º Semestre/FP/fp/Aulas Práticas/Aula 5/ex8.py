number = int(input("Escreva um número inteiro positivo: "))

def divisaoINteira(n):
    contagem = 1
    while n >= 10:
        n = n // 10
        contagem += 1
    return contagem

while number < 0:
    print("O número que inseriu não é positivo.")
    number = int(input("Escreva um número inteiro positivo: "))

print("O número que inseriu tem", divisaoINteira(number), " dígitos.")
