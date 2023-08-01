def area_coroa ():
    r1 = float(input("Escreva o valor do raio interior da coroa circular: "))
    r2 = float(input("Escreva o valor do raio exterior da coroa circular: "))

    while r1 <= 0 and r2 <= 0 and r1 > r2:
        print("O número que introduziu não é válido.")
        print("     TENTE NOVAMENTE")
        r1 = float(input("Escreva o valor do raio interior da coroa circular: "))
        r2 = float(input("Escreva o valor do raio exterior da coroa circular: "))
    area_r1 = 3.14 * (r1**2)
    area_r2 = 3.14 * (r2**2)
    area_coroa_circular = area_r2 - area_r1
    return area_coroa_circular

print(area_coroa())
