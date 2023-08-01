num1 = float(input("Escreva um número real:"))
num2 = float(input("Escreva outro número real: "))
num3 = float(input("Escreva outro número real: "))

def maximumNumber (firstNumber, secondNumber, thirdNumber):
    if num1 > num2 and num1 > num3:
        print("Dos três números que introduziu, o maior é: ", num1)

    elif num2 > num1 and num2 > num3:
        print("Dos três números que introduziu, o maior é: ", num2)

    elif num3 > num1 and num3 > num2:
        print("Dos três números que introduziu, o maior é: ", num3)

    else:
        print("Os dois números são iguais.")

maximumNumber(num1, num2, num3)
