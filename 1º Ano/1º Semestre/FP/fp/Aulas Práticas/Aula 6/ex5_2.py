string = input("Escreva algo: ")

def inverterOrdem (n):
    string2 = ""
    for i in range(len(n)-1, -1, -1):
        string2 += n[i]
    return string2
print("String com a ordem invertida:", inverterOrdem(string))
