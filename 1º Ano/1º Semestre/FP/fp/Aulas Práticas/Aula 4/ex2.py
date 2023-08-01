import random
n = random.randint(1,100)
count = 0
number = int(input("Insira um número: "))

while number != n:
    if number > n:
        print("O número escolhido foi demasiado alto..." )

    elif number < n:
        print("O número escolhido é demasiado baixo.")
    number = int(input("Insira um número: "))
    count = count + 1

print("Utilizou", count, " tentativas até chegar ao valor certo.")
print("FIM")
