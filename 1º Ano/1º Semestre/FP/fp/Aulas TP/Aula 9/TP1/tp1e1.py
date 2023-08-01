f = open('xpto.txt')

while True:
  s = f.readline()
  if s == '':
    break
  print('a)', s.rstrip())
  
f.seek(0)
for s in f:
  print('b)', s.rstrip())
  
f.close()
f = open('xpto.txt')
f2 = open('out.txt', 'w')
for s in f:
  print('c)', s.rstrip())
  f2.write(s)
f2.close()