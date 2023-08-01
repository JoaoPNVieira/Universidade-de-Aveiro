# funções para o problema das datas
# AN 2017

def bissexto(a):
  if (a % 4 == 0 and a % 100 != 0) or a % 400 == 0:
    return True
  else:
    return False

def diasDoMes(m , a):
  dias = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  nDias = dias[m]
  if m == 2 and bissexto(a):
      nDias = 29
  return nDias

def diaAnterior(d, m, a):
  da = d - 1 # dia anterior
  ma = m
  aa = a
  if da == 0:
    ma = m - 1
    if ma == 0:
      ma = 12
      aa = a - 1

    da = diasDoMes(ma, aa)
  
  print('Data anterior ', da, '-', ma, '-', aa)
  
ano = int( input('ano: ') )
mes = int( input('mes ') )
dia = int( input('dia '))
print('O mes ' , mes, ' do ano ', ano, ' tem ', diasDoMes(mes, ano))
diaAnterior(dia, mes, ano)
