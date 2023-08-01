m = float(input("Introduza um número real: "))
n = float(input("Introduza um número real: "))

def multiplication (m, n):
    resultado = 0
    while n > 0:
        resultado += m
        n -= 1
    return(resultado)

print('m x n =', multiplication(m, n))
