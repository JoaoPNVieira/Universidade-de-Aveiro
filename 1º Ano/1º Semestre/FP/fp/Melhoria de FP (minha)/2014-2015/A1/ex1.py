while True:
    num = input("Escreva o número: ")
    if num.isdigit():
        break
    else:
        print("Input iválido!", end=" ")

for i in range(100):
    print()

count = 1
while True:
    while True:
        tentativa = input("Tenativa nº{}: ".format(count))
        if tentativa.isdigit():
            break
        else:
            print("Input iválido!", end=" ")
    if float(tentativa) == float(num):
        print("Acertou")
        break
    elif float(tentativa) < float(num):
        print("Menor")
        count += 1
    elif float(tentativa) > float(num):
        print("Maior")
        count += 1

print("Utilizou {} tentativas.".format(count))
print("FIM!")
