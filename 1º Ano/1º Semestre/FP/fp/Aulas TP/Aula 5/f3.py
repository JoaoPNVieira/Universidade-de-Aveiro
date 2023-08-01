# funções com valor de retorno
# AN 2017

def soma(a, b):
  c = a + b
  print('estamos dentro da funcao: ', c)
  return c
  
x = int( input('x ') )
y = int( input('y ') )
z = soma(x, y)
print('soma = ', z)

