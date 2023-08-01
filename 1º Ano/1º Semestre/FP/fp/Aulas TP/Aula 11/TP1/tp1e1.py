num = [1, 2, 3 ,4, 5]
n2 = [2 * i for i in num]
print(n2)

n3 = [ i + j for i in num for j in n2]
print(n3)