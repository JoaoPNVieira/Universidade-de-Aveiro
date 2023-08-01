num1 = float(input("Escreva um número real:"))
num2 = float(input("Escreva outro número real: "))

def maximumNumber (firstNumber, secondNumber):
    if num1 > num2:
        print("Dos dois números que introduziu, o maior é: ", num1)

    elif num1 == num2:
        print("Os dois números são iguais.")

    else:
        print("Dos dois números que introduziu, o maior é: ", num2)

maximumNumber(num1, num2)
