n = int( input('First value: ') )

odd = 0
even = 0
sum = 0

while n >= 0:
  if n % 2 == 0:
    even = even + 1
  else:
    odd = odd + 1

  sum = sum + n

  n = int( input('another value: ') )

print("even: ", even, ' odd ' , odd)
print("sum: ", sum)
