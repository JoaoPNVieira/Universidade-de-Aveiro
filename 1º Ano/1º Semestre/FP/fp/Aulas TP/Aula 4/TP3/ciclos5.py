# tabuada
# AN 2017
n = int( input('numero ') )

for i in range(1, 11):
  x = i * n
  print(i, ' x ', n, ' = ', x)

for i in range(1, 11):
  x = i * n
  print( '{:<2d} x {:>2d} = {:>3d}'.format(i, n, x) )
