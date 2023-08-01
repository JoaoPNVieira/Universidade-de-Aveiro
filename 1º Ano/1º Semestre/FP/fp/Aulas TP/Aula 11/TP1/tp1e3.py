l = [1, 5, 3, 4, 2]
print(l)
l.sort()
print(l)

l = [1, 5, 3, 4, 2]
l2 = sorted(l)
print('l2 = ', l2)
l3 = sorted(l, reverse=True)
print('l3 = ', l3)

d = {'ana':123, 'zzz':321, 'xpto':234}
d2 = sorted(d)
print(d2)
for k in d2:
    print(k, d[k])
    
l = [('z', 1), ('a', 5), ('c', 3), ('c', 1), ('a', 1)]
l2 = sorted(l)
print(l2)

def myFunc(t):
    return t[1]

l3 = sorted(l, key = myFunc)
print(l3)

def myFunc2(t):
    return t[1], t[0]

l4 = sorted(l, key = myFunc2)
print(l4)

l5 = sorted(l, key = lambda t:(t[1],t[0]))
print(l5)

f = lambda x, y : x + y
print('lambda:',f(2, 3))