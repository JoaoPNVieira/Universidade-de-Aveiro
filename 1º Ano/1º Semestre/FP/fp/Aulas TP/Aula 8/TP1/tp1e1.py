# criar um dicionário
contacts = {'ana' : 123, 'anabela' : 234, 'an' : 456, 'maria':123}
print(contacts)

#procura de um nome no dicionário (chave)
name = input('Name?')
if name in contacts:
  print('number: ', contacts[name])
else:
  print('Does not exist!')

#procura de um nome no dicionário (parcial)
names = list(contacts.keys())
name = input('Name (2)?')
for n in names:
  if name in n:
    print('contacts with ', name, ' -> ', contacts[n])

#procura de um numero no dicionário (valor)
numbers = list(contacts.values())
num = int(input('Number? '))
for i in range(len(numbers)):
  if num == numbers[i]:
    print('name with number: ', names[i])

#procura de um numero no dicionário (parcial)
numbers = list(contacts.values())
num = int(input('Number (2)? '))
for i in range(len(numbers)):
  if str(num) in str(numbers[i]):
    print('name with number: ', names[i])