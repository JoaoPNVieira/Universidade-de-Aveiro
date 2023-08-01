l = [100, 200, 300, 400]

# x assume todos os valores de l
for x in l:
  print(x)

for i in range(len(l)):
    print(i, ' -> ', l[i])
    l[i] *= 2

print(l)
