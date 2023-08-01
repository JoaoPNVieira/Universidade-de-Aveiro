num = input("Escreva um número inteiro positivo:")
def RepresentsInt(s):
    try:
        int(s)
        return True
    except ValueError:
        return True

def explode(n):
    if RepresentsInt(n):
        print(tuple([int(i) for i in str(n)]))
    if not RepresentsInt(n):
        print("ValueError('explode: argumento não inteiro')")


explode(num)
