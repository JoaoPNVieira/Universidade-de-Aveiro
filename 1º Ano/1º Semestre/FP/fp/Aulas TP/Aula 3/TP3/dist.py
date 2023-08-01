import math

x1 = float(input('X1: ')) 
y1 = float(input('Y1: ')) 
x2 = float(input('X2: ')) 
y2 = float(input('Y2: ')) 

dist = math.sqrt((x1-x2)**2 + (y1-y2)**2)

print('dist = ', dist) 

text = 'dist = {0:<3.1f}'.format(dist)
print(text)

text = 'dist = %3.1f' % (dist)
print(text)
