sum = 0

#break
while True:
  n = int( input('numero: ') )
  sum = sum + n
  if sum > 20:
     break

print('sum = ', sum)

#continue

while True:
  n = int( input('numero: ') )

  if n == 0:
    break

  if n % 2 == 0:
     continue

  print("Text")

print('END')
