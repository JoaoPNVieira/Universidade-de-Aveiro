n = eval(input("Escreva um número inteiro positivo: "))

def numero_algarismos(n):
    algarismos = 1 #um número tem sempre pelo menos um algarismos
    while n > 9: # de 10 para cima
        algarismos = algarismos + 1 # adicionamos o segundo algarismo
        n = n // 10 #se depois de dividirmos o ciclio volta ao inicio e faz as lins 6 e 7 até que n <= 9!
    return algarismos

print(numero_algarismos(n))
