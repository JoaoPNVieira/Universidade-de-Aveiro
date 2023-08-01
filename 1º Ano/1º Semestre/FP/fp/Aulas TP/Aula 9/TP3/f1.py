f = open('numeros.txt', 'r')

while True:
  s = f.readline()
  if s == '':
    break
  print('a) ', s, end='')

print()
f.seek(0)
for s in f:
  print('b)', s, end='')

print()
f.close()
f = open('numeros.txt', 'r')
for s in f:
  print('c)', s, end='')
  
f2 = open('output.txt', 'w')
f.seek(0)
for s in f:
  f2.write(s)
f2.close()