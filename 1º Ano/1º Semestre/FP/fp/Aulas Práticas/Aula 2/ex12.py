a = float(input("Insira o valor do cateto A: "))
b = float(input("Insira o valor do cateto B: "))

c = (a**2 + b**2)**(1/2)
import math
angulo = math.atan(a/b)
anguloFinal = math.degrees(angulo)

print("O valor da hipótenusa do triângulo [ABC] é: ", c, " e o valo do ângulo (em graus) entre o lado A e a hipótenusa é: ", anguloFinal, ".")
