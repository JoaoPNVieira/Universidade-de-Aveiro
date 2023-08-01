x = int( input('x: '))
y = int( input('y: '))

if x > 0 and y > 0:
  print('x is positive and y is positive')

elif x > 0 and y < 0:
  print('x is positive and y is negative')

elif x < 0 and y > 0:
  print('x is negative and y is positive')

else:
  print('x is negative and y is negative')

if x > 0:
  if y > 0:
    print('x is positive and y is positive')

  else:
    print('x is positive and y is negative')

else:
  if y > 0:
    print('x is negative and y is positive')

  else:
    print('x is negative and y is negative')



print('the program continues here...')
