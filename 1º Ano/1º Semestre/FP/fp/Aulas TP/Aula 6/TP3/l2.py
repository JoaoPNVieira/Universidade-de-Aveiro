# listas e ciclos
# AN 2017

l = ['fp', 'listas', 5, 3.0]

# iterar sobre todos os elementos de uma lista
for x in l:
  print(x)
  
# iterar sobre a lista através dos indíces
print('indices: ', end='') # não muda de linha no final
for i in range( len(l) ):
  print(l[i], end=',') # coloca uma ,  no final
  l[i] = 'lixo' # altera o conteúdo daquela posição da lista
 
print() # muda de linha
print(l)