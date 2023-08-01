n = int(input("Escreva a ordem do elmento da sequência de Fibonacci que deseja calcular: "))

def Fibonacci(n):
    if n == 0:
        fib = 0
    elif n == 1:
        fib = 1
    else:
        fib = Fibonacci(n-1) + Fibonacci(n-2)
    return fib

print("O elemento da sequência de Fibonacci de ordem n =", n, "é:", Fibonacci(n))
