x = float(input("Escreva um número real: "))
a = float(input("Escreva um número real para o parâmetro a: "))
b = float(input("Escreve um número real para o parâmetro b: "))
c = float(input("Escreve um número real para o parâmetro c: "))
def funcaoPolinomio (parameter1, parameter2, parameter3, incognita):
        f = parameter1*(incognita**2) + parameter2*(2*incognita) + parameter3
        return f

print("A função toma o valor ", funcaoPolinomio(a, b, c, x))
