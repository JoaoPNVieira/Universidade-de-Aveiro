# soma de todos os numeros ate N
# multiplicacao de todos os numeros ate N
#AN 2017

n = int( input('num ') )

soma = 0
mult = 1

while n >= 0:
  soma = soma + n
  mult = mult * n
  n = int( input('num ') )

print('soma ', soma, 'mult ', mult)  
