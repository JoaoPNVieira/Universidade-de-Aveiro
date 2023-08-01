def loadContacts(fname):
  d = {}
  try:
    f = open(fname, 'r')
    while True:
      k = f.readline().rstrip()
      if k == '':
        break
      v = f.readline().rstrip()
      try:
        num = int(k)
        d[num] = v
      except ValueError:
        print('Contacto ignorado')
        
  except IOError:
    print('Erro ao aceder ao ficheiro')
  return d

contactos = loadContacts('contactos.txt')
print(contactos)