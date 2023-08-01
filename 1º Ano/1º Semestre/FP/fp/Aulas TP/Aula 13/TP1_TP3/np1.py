import numpy as np

a = np.array([2,3,4])
print('a', a)

b = np.zeros( (3,4) )
print('b', b)
b += 5
print('b after +=',b)

c = np.arange( 10, 30, 5 )
print('c', c)
for x in c:
    print('for', x)

bbv = np.vstack((b, b))
print('vstack', bbv)
bbh = np.hstack((b, b))
print('hstack', bbh)

d = np.linspace( 0, 2, 9 )
print('d', d)

print('sum d: ', np.sum(d))

e = np.arange(12).reshape(3,4)
print('e', e)
print('min e each row', e.min(axis=1))

print('>', e > 6)
