contagem2 = dict()
n = input("Esreva algo: ")

for i in n.lower().split():
    if i in contagem2:
        contagem2[i] += 1
    else:
        contagem2[i] = 1

print("Segundo método:\n--> ",contagem2)
