# let's ask for the string
n = input("Esreva algo: ")

print("a)")
contagem = {}  # também posso incializar o dicionário vazio da seguinte forma: contagem = dict() !!!!

for i in n.upper():
    if i in contagem:
        contagem[i] += 1
    else:
        contagem[i] = 1

print("Primeiro método:\n--> ",contagem)

print("\n\nb)")
contagem2 = dict()

for i in n.lower():
    if i.isalpha():
        if i in contagem2:
            contagem2[i] += 1
        else:
            contagem2[i] = 1

print("Segundo método:\n--> ",contagem2)
