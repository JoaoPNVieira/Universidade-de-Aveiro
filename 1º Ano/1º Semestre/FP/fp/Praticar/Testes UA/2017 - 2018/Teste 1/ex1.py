peso = float(input("Peso (kg)? "))
altura = float(input("Altura (m)? "))

imc = peso / altura**2

print("O adulto tem um IMC de {0:.1f}".format(imc))

if imc < 18.5:
    print("Baixo peso")
elif 18.5 <= imc <= 25:
    print("Normal")
else:
    print("Obesidade")
