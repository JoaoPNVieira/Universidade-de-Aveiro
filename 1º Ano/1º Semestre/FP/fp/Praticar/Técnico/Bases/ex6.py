num1 = float(input("Escreva um número: "))
num2 = float(input("Escreva outro número: "))
num3 = float(input("Escreva outro número: "))

if num1 > num2 and num1 > num3:
    print("O maior número inserido é:", num1)

elif num2 > num1 and num2 > num3:
    print("O maior número inserido é:", num2)

elif num3 > num1 and num3 > num2:
    print("O maior número inserido é:", num3)

elif num1 == num2 and num1 == num3:
    print("Os números são todos iguais.")
