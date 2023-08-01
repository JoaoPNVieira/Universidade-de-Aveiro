def escolha_1 ():
    n = eval(input("""Escolha a área a calcular:
    (1) Quadrado
    (2) Retângulo
    (3) Triângulo
    (4) Circunferência
    >>>"""))
    while n < 1 or n > 4 or type(n) != int:
        print("ERRO! Tente outra vez...\n")
        n = int(input("""Escolha a área a calcular:
        (1) Quadrado
        (2) Retângulo
        (3) Triângulo
        (4) Circunferência
        >>>"""))
    return n
def quadrado ():
    print("Vamos calcular a área e o perímetro de um quadrado")
    x1 = eval(input("Lado: "))
    while x1 < 0:
        print("O valor que introduziu não é válido, tente outra vez.")
        x1 = eval(input("Lado: "))
    area = x1 * x1
    perimetro = 4*x1
    print("Área do quadrado:",area,"\nPerímero do quadrado:", perimetro)
def retangulo ():
    print("Vamos calcular a área e o perímetro de um retângulo")
    x1 = eval(input("Comprimento: "))
    x2 = eval(input("Largura: "))
    while x1 < 0 or x2 < 0:
        print("O valor que introduziu não é válido, tente outra vez.")
        x1 = eval(input("Comprimento: "))
        x2 = eval(input("Largura: "))
    area = x2 * x1
    perimetro = 2*x1 + 2*x2
    print("Área do quadrado:",area,"\nPerímero do quadrado:", perimetro)
def triangulo ():
    print("Vamos calcular a área de um triângulo")
    x1 = eval(input("Base do triângulo: "))
    x2 = eval(input("Altura do triângulo: "))
    while x1 < 0 or x2 < 0:
        print("O valor que introduziu não é válido, tente outra vez.")
        x1 = eval(input("Base do triângulo: "))
        x2 = eval(input("Altura do triângulo: "))
    area = (x1 * x2) / 2
    print("Área do triângulo:",area)
    print("\nVamos calcular o perímetro de um triângulo")
    x1 = eval(input("Lado do triângulo: "))
    while x1 < 0:
        print("O valor que introduziu não é válido, tente outra vez.")
        x1 = eval(input("Lado do triângulo: "))
    perimetro = 3*x1
    print("Perímetro do triângulo:",perimetro)
def circunferencia ():
    print("Vamos calcular a área e o perímetro de uma circunferência:")
    x1 = eval(input("Raio: "))
    while x1 < 0:
        print("O valor que introduziu não é válido, tente outra vez.")
        x1 = eval(input("Raio: "))
    area = 3.14 * (x1**2)
    perimetro = 2*x1*3.14
    print("Ára da circunferencia:",area,"\nPerímetro da circunferência:",perimetro)


n = escolha_1()
if n == 1:
    quadrado()
elif n == 2:
    retangulo()
elif n == 3:
    triangulo()
elif n == 4:
    circunferencia()
