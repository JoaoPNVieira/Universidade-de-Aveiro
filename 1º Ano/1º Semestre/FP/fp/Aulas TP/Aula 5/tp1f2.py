def sumTwo(a, b):
  s = a + b
  return s
 
def sumFour(a, b, c, d):
  return sumTwo(a, b) + sumTwo(c, d)

y = sumTwo(5, 5)
print("sum = ", y)

print('sum 4: ', sumFour(1, 2, 3, 4))

k = int(input('one number') )
l = int(input('another'))
print(sumTwo(b = k, a = l))