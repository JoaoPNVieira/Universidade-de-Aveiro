q = int(input("Escreva um número inteiro positivo correspondente à quantia a depositar: "))
j = float(input("Escreva um número inteiro entre 0 e 1 (ambos exclusive) correspondente ao valor da taxa de juros: "))

def duplicar (x, y):
    while q < 0 or (j < 0 or j > 1):
        print("Um (ou mais) dos valores introduzidos não são aceitável.")
    valorTotal = x * (1 + y)** z
    while valorTotal != 2*x:
        z += 1
        valorTotal = x * (1 + y)** z
    return z

print(valor(q, j))
