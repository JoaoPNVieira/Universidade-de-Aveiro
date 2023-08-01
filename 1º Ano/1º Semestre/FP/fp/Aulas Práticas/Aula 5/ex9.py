x = int(input("Escreva um número: "))
y = int(input("Escreva outro número: "))

def MDC(a, b):
    if a > b:
        while (b != 0):
            q = a / b
            r = a % b
            a = b
            b = r
        return a

print("O maior divisor comum entre", x, "e", y, " é:", MDC(x, y))
