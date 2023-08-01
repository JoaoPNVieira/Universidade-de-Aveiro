def calculoImc (weight, height):
    imc = (weight / height**2)
    return imc

while(True):
    x = float(input("Escreva o seu peso (em Kg): "))
    y = float(input("Escreva a sua altura (em metros): "))
    if x > 0 and y >0:
        print("O seu índice de massa corporal é: ", calculoImc(x, y), ".")
        break

    else:
        print("Os valores deram são errados.")
