# funções e listas
# AN 2017

def lerListaInteirosTeclado():
  # função para ler numeros e preencher uma lista
  # termina a leitura com o aparecimento do zero
  # termina a leitura depois de cinco números
  l = []
  x = int( input('numero: '))
  while x != 0:
    l.append(x)
    if len(l) == 5:
      break
      
    x = int(input('mais numeros: '))
  
  return l

lista = lerListaInteirosTeclado()
print(lista)