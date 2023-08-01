n = int(input("Escreva o valor de n: "))

def aproxPi (n):
    soma = 0
    for element in range(0, n+1):
        number = ((-1)**element)/(2*element+1)
        soma += number
    return soma

print(aproxPi(n))
