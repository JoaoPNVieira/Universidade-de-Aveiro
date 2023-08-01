def lerValorRealPositivo (n):
    x = float(input(n))
    while x <= 0:
        print("Número inválido!")
        x = float(input(n))
    return x

def lerValorRealNaoNegativo (n):
    x = float(input(n))
    while x < 0:
        print("\nNúmero inválido!")
        x = float(input(n))
    return x

def escolha_1 ():
    while (True):
        n = lerValorRealNaoNegativo("\n      <-- MENU 1 -->\n\nEscolha a área a calcular:\n(1) Quadrado\n(2) Retângulo\n(3) Triângulo\n(4) Circunferência\n(prima 0 para sair deste menú)\n>>> ")
        if n == 0:
            print("\nFIM!\nAté breve.")
            break
        else:
            if n == 1:
                quadrado()
            elif n == 2:
                retangulo()
            elif n == 3:
                triangulo()
            elif n == 4:
                circunferencia()

def escolha_2 (x, y, z):
    while (True):
        n = lerValorRealNaoNegativo("\n   <-- MENU 2 -->\nO que quer calcular?\n(1) Área da figura\n(2) Perímetro da figura\n(3) Volume do sólido\n(prima 0 para sair deste menú)\n>>> ")
        if n == 0:
            break
        else:
            if n == 1:
                print("Área da figura:", x)
            elif n == 2:
                print("Perímero da figura:", y)
            elif n == 3:
                print("Volume do cubo:", z)

def quadrado ():
    while (True):
        x1 = lerValorRealPositivo("\nLado: ")
        h = lerValorRealPositivo("Altura: ")
        area = x1 * x1
        perimetro = 4*x1
        volume = area * h
        escolha_2(area, perimetro, volume)
        break

def retangulo ():
    while (True):
        x1 = lerValorRealPositivo("\nComprimento: ")
        x2 = lerValorRealPositivo("Largura: ")
        h = lerValorRealPositivo("Altura: ")
        area = x2 * x1
        perimetro = 2*x1 + 2*x2
        volume = area * h
        escolha_2(area, perimetro, volume)
        break

def triangulo ():
    while (True):
        x1 = lerValorRealPositivo("\nBase do triângulo: ")
        x2 = lerValorRealPositivo("Altura do triângulo: ")
        x3 = lerValorRealPositivo("Lado do triângulo: ")
        h = lerValorRealPositivo("Altura do sólido: ")
        area = (x1 * x2) / 2
        perimetro = 3*x3
        volume = area * h
        escolha_2(area, perimetro, volume)
        break

def circunferencia ():
    while (True):
        x1 = lerValorRealPositivo("Raio: ")
        area = 3.14 * (x1**2)
        perimetro = 2*x1*3.14
        volume = (4/3)*3.14*(x1**3)
        escolha_2(area, perimetro, volume)
        break


escolha_1()
