# criar um dicionário
contactos = {'ana':123, 'maria': 234, 'manuel':567, 'andre': 900}

# acesso a todos os items do dicionário - cada item é um tuplo
for c in contactos.items():
  print(c)

# exemplo de tuplos como resultado de uma função
def f():
  return 1, 2, 3

print('A funcao devolve tres numeros: ', f())