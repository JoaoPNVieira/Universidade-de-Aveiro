def bissexto ():
    ano = int(input("Escreva o número um ano à sua escolha: "))
    if (ano % 4 == 0 and ano % 100 != 0) or ano % 400 == 0:
        return True
    else:
        return False

print(bissexto( ))
