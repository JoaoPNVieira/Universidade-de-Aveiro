def area_circulo ():
    r = float(input("Escreva o valor do raio do círculo: "))
    while r <= 0:
        print("O número que introduziu não é válido.")
        print("     TENTE NOVAMENTE")
        r = float(input("Escreva o valor do raio do círculo: "))
    area = 3.14 * (r**2)
    return area

print(area_circulo())
