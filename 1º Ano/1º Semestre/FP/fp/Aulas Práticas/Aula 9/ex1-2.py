fin = open("nums.txt", "r")
soma = 0
for i in fin:
    soma += float(i.rstrip())
fin.close()

print(soma)
