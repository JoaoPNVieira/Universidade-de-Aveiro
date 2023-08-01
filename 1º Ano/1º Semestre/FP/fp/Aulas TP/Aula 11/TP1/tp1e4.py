f = open('fp.csv', 'r', encoding='utf8')
d = {}
f.readline() #ignore header

for l in f:
    fields = l.rstrip().split(',')
    #print(fields)
    d[fields[0]] = tuple(fields[1:])

for k in d:
  print(k, d[k])

l = sorted(d, key = lambda k:d[k][1])
for k in l:
  print('sorted:', k, d[k])
  
f.close()
