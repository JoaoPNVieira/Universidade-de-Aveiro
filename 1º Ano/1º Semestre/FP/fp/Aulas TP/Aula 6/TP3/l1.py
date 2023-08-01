# exemplo sobre manipulação de listas
# AN 2017

#criar duas listas
l1 = [1, 2, 3, 4, 5]
l2 = [1, 'ola', 3.0]

# impressão
print(l1)
print(l2)

# acesso a elementos das listas
print('l1[0] = ', l1[0])
print('l2[-1] = ', l2[-1])

print('l1[0:2]', l1[0:2])

# alteracao de um elemento
print('antes: ', l1)
l1[0] = 50
print('depois: ', l1)

# referencias
l2 = l1
print('l2 = ', l2)
l2[1] = 100
print('l1 depois de l2[1]=100', l1)
l1[2] = 200
print('l2 depois de l1[2]=200', l2)
