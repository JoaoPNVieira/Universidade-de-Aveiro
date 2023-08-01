# funções para demonstrar a passagem de parâmetros
# AN 2017

def imprimeCincoVezes(texto):
  for i in range(5):
    print(texto)

def imprimeNVezes(texto, n):
  for i in range(n):
    print(texto, end='->')
  print() #mudança de linha do final


def imprimeNVezesPorDefeitoCinco(texto, n=5):
  for i in range(n):
    print(texto, end='**')
  print() #mudança de linha do final

# os argumentos são passados por posição se nada for dito em contrario
imprimeCincoVezes('lixo')
imprimeNVezes('ola', 1)

# passagem por keyword
imprimeNVezes(n = 5, texto = 'aveiro')

# argumentos por defeito
imprimeNVezesPorDefeitoCinco('coisas')