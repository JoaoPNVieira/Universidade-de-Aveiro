# criar um dicionário
contactos = {'ana':123, 'maria': 234, 'manuel':567, 'andre': 900}

print(contactos)
print(contactos['ana']) # acesso a um valor do dicionário

# dict.keys doesn't return a list, but a set-like object that represents a view of the dictionary's keys
# being a set, it doesn't support indexing
# Performing list(d.keys()) on a dictionary returns a list of all the keys used in the dictionary
# acesso à lista de chaves
nomes = list(contactos.keys())

# acesso à lista de valores
nums = list(contactos.values())

print('chaves: ', contactos.keys(), ' ou ', nomes)
for c in nomes:
  print(c)
  
print('valores: ', contactos.values())

# procurar um nome no dicionário (chave)
nome = input('Nome a procurar? ')
if nome in contactos:
  print(nome , '->', contactos[nome])
else:
  print('Nao existe')

# procurar um número no dicionário (valor)
n = int(input('Numero a procurar? '))
for i in range(len(nums)):
  if n ==  nums[i]:
    print('O nome é : ', nomes[i])
    