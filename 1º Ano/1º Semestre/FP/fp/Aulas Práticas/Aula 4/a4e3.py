n = int( input('numero') )

cont = 0

for i in range(1, n + 1): #[1, n]
  if n % i == 0:
    cont = cont + 1

if cont == 2:
  print('Primo')
else:
  print('NAO')
