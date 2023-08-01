x = float(input("Insira um número real: "))

def tax(r):
    if r <=  1000:
        functionValue = 0.1*r
        return functionValue

    elif 1000 < r <= 2000:
        functionValue = 0.2*r - 100
        return functionValue

    else:
        functionValue = 0.3*r - 300
        return functionValue

print(tax(x))
