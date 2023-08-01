print("I will ask you two numbers.")
num1 = float(input("Write a number: \n"))
num2 = float(input("Write another number: \n"))

func = (num1 + 3 * num2) * (num1 - num2)

print("O valor de (",num1,"+ 3 *",num2,") * (",num1,"-",num2,") é: {0:.0f}".format(func))
