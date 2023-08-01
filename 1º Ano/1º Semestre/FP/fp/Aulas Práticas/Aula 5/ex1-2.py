def calculoImc (weight, height):
    imc = (weight / height**2)
    return imc

x = float(input("Escreva o seu peso (em Kg): "))
y = float(input("Escreva a sua altura (em metros): "))

while(x < 0 or y <0):
    print("Os valores deram são errados.")
    x = float(input("Escreva o seu peso (em Kg): "))
    y = float(input("Escreva a sua altura (em metros): "))

print("O seu índice de massa corporal é: ", calculoImc(x, y), ".")
