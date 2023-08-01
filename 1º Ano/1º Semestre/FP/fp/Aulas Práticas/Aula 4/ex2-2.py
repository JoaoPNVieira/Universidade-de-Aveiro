import random
n = random.randint(0, 100)
number = int(input("Insira um número interio entre 0 e 100: "))
contagem = 1

while  number > 100 or number < 0:
    print("O número que escolheu não está de acordo com as regras do jogo, tente outra vez.")
    number = int(input("Insira outro número interio entre 0 e 100: "))

while number != n:
    if number > n:
        print("O número escolhido foi demasiado alto...")

    elif number < n:
        print("O número escolhido foi demsiado baixo...")
    number = int(input("Insira outro número interio entre 0 e 100: "))
    contagem += 1

print("Parabéns, acertou.")
print("Utilizou ", contagem, " tentativas até acertar.")
print("FIM!")
