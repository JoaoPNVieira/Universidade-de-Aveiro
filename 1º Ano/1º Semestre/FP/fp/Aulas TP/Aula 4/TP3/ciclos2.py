# leitura de numeros ate aparecer valor zero
# contagem de quantos numeros sao pares e impares
# AN 2017

n = int( input('primeiro numero ') )

#inicializacao
pares = 0
imp = 0

while n != 0:
  if n % 2 == 0:
    pares = pares + 1
  else:
   imp = imp + 1

  n = int( input('numero ') )
#fim do ciclo

print('pares: ', pares, 'imp', imp)
