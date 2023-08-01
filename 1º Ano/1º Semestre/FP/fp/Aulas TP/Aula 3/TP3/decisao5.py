x = int(input('x: '))
y = int(input('y: '))

if x > 0:
  if y > 0:
    print('x e positivo e y e positivo')
  else:
    print('x e positivo e y e negativo')

else:
  if y > 0:
    print('x e negativo e y e positivo')
  else:
    print('x e negativo e y e negativo')

if x > 0:
  textox = 'positivo'

else:
  textox = 'negativo'

if y > 0:
  textoy = 'positivo'

else:
  textoy = 'negativo'

print('x e ', textox, ' e y e ', textoy)
