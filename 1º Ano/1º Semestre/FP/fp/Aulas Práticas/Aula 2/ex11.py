#Let's create P1

x1 = float(input("Introduza a abcissa (valor de x) do ponto 1: "))
y1 = float(input("Introduza a ordenada (valor de y) do ponto 1: "))

#Let's create P2

x2 = float(input("Introduza a abcissa (valor de x) do ponto 2: "))
y2 = float(input("Introduza a ordenada (valor de y) do ponto 2: "))

#Now I will calculate de distance between P1 and P2

distance = ((x2 - x1)**2 + (y2 - y1)**2)**(1/2)

print("A distância entre os dois pontos é: ", distance)
