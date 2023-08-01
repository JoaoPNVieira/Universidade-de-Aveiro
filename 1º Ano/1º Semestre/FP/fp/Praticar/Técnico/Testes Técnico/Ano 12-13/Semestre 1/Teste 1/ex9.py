n = eval(input("Escreva um número inteiro positivo: "))

def soma_quadrados(n):
    soma = 0
    while n < 0 or type(n) != int:
        return "O número introduzido não é válido."
    while n != 0:
        soma += (n * n)
        n -= 1
    return soma

print(soma_quadrados(n))
