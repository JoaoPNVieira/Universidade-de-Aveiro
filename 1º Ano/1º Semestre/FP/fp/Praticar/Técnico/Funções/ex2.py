horas = int(input("Escreva um número inteiro correscondente a um número de horas: "))

def horas_dias (x):
    dias = x / 24
    return dias

print(horas, "hora(s) equivalem a {0:.3f}".format(horas_dias(horas)),"dia(s).")
