q = int(input("Escreva um número inteiro positivo correspondente à quantia a depositar: "))
j = float(input("Escreva um número inteiro entre 0 e 1 (ambos exclusive) correspondente ao valor da taxa de juros: "))
n = int(input("Escreva um número inteiro positivo correspondente ao número de anos que o dinheiro irá estar a render: "))

def valor (x, y, z):
    while q < 0 or (j < 0 or j > 1) or n <0:
        print("Um (ou mais) dos valores introduzidos não são aceitável.")
    valorTotal = x * (1 + y)**z
    return valorTotal

def duplicar (x, y):
    valorTotal = x * (1 + y)
    return valorTotal



#print(valor(q, j, n))
print(duplicar(q, j))
