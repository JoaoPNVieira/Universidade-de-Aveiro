def sumTwo(a, b):
  s = a + b
  return s

def sumFour(a, b, c, d):
  print("a before ", a)
  a = sumTwo(a, b)
  print("a after ", a)
  return a + b+ c+ d
  
print(sumFour(1, 2, 3, 4))