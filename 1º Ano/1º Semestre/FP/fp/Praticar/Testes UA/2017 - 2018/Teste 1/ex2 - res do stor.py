# a) funcao para imprimir um menu
def menu():
  print()
  print('Opções disponíveis:')
  print('0 - sair')
  print('1 - introduzir nova medida')
  print('2 - mostrar média atual')
  return int(input('Opção? '))

# b) funcao para ler valores positivos com validacao
def lerValorPositivo(text):
  n = float(input(text))
  while n < 0.0:
    n = float(input('Número inválido! ' + text))
  
  return n


# c) funcao para calcular o IMC
def imc(weight, height):
  return weight / (height ** 2)


# d) funcao para imprimir mensagem
def classificacao(value):
  if value < 18.5:
    print('Baixo peso')
    
  elif value <= 25:
    print('Normal')
    
  else:
    print('Obesidade')


# e) programa com base num menu que vai pedindo medidas ao utilizador e vai calculando estatísticas
print('Bem vindo(a) à calculadora do IMC')
n = 0
sumBmi = 0
while True:
  op = menu()
  if op == 0:
    print('FIM')
    break;
  
  elif op == 1:
    w = lerValorPositivo('Peso? ')
    h = lerValorPositivo('Altura? ')
    b = imc(w, h)
    print('Adulto com um IMC de {:<.1f}'.format(b))
    classificacao(b)
    sumBmi += b
    n += 1
  
  elif op == 2:
    print('Estatísticas atuais: ')
    if n == 0:
      print('Ainda não foram efetuados cálculos!')
    else:
      print('Valor médio do IMC para ', n, ' adultos: ', '{:<.1f}'.format(sumBmi / n))
  
  else:
    print('Opção inválida!')

print('Até breve')
