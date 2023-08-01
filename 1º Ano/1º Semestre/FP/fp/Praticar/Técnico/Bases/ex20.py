n = ""
indice = 8

for i in range(1,10):
    n += str(i)
    num = (int(n) * indice) + i
    print(n,"x",indice,"+",i,"=",num)
