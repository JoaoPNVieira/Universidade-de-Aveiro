x = float( input('primeiro numero: ') )
cont = 0
soma = 0

while x != 0:
  soma = soma + x
  cont = cont + 1
  x = float( input('numero: ') )

if cont != 0:
  media = soma / cont
else:
  media = 0

print('media ', media)
print('FIM')
