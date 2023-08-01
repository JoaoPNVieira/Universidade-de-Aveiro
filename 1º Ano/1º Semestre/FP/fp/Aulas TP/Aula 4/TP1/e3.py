
n = int( input('Mult table: ') )

i = 1
while i <= 10:
  y = i * n
  print( ' a) ', i , ' x ' , n, ' = ', y)
  i = i + 1 

for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]:
  y = i * n
  print( ' b) ', i , ' x ' , n, ' = ', y)

for i in range(1, 11):
  y = i * n
  print( ' c) ', i , ' x ' , n, ' = ', y)


