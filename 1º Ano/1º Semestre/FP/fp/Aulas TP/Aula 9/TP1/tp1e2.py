def readContacts(fname):
  f = open(fname, 'r')
  contacts = {}
  while True:
    num = f.readline()
    if num == '':
      break
    name = f.readline()
    contacts[int(num)] = name.rstrip()
  f.close()
    
  return contacts

def findName(contacts):
  num = int(input('Number?'))
  if num in contacts:
    print('name: ', contacts[num])
  else:
    print('Does not exist!')
  
def addContact(contacts):
  num = int(input('Numero?'))
  name = input('Name?')
  contacts[num] = name
  
def saveContacts(contacts, fname):
  f = open(fname, 'w')
  for n in contacts:
    f.write(str(n))
    f.write('\n')
    f.write(contacts[n])
    f.write('\n')
  
  f.close()
  
########################################
contacts = readContacts('contactos.txt')

while True:
  print('0 - list; 1 - call; 2 - add, 3 - end...')
  op = int(input('option?'))
  if op == 0:
    print(contacts)
  elif op == 1:
    findName(contacts)
  elif op == 2:
    addContact(contacts)
  elif op == 3:
    break
  else:
    print('Not implemented')

saveContacts(contacts, 'contactos.txt')