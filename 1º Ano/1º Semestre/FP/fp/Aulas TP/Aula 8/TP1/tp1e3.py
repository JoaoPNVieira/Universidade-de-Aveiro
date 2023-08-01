contacts = {'ana' : 123, 'anabela' : 234, 'an' : 456, 'maria':123}

# items of the dictionary as tuples
l = list(contacts.items())
print('tuples list: ', l)

for i in contacts.items():
  print(i)
  print(i[0], ' - ', i[1])

# zip function
s1 = 'abc'
s2 = '123'
l = list(zip(s1, s2))
print(l)

#create a dictionary based on a list of tuples
dict = dict(l)
print(dict)

# function returning a tuple
def f():
  return 1, 2, 3

print('f = ', f())

# tuples as keys
d = {(1, 2):'primeiro', (3, 4):'segundo'}
print(d[(1, 2)])