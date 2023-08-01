x = int(input("Escreva um número inteiro postivo: "))

def countdown(N):
    for number in range(N, -1, -1):
        print(number)

countdown(x)
