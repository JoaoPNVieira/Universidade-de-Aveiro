n = input('Escreva algo: ')

def inverterOrdem (string):
    n2 = ""
    for i in range(len(n)-1, -1, -1):
        n2 += n[i]
    return n2

print(inverterOrdem(n))
