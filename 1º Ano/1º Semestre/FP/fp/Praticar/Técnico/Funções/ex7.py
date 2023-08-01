mes = input("Escreva as primeiras 3 letras (em minúsculas) do mês à sua escolha: ")
ano = int(input("Escreva o número do ano à sua escolha: "))

def dias_mes (x, y):
    if x=="jan" or x=="mar" or x=="mai" or x=="jul" or x=="ago" or x=="out" or x=="dez":
        dias = 31

    if x == "fev":
        if (y % 4 == 0 and y % 100 != 0) or y % 400 == 0:
            dias = 29
        else:
            dias = 28

    if x=="abr" or x=="jun" or x=="set" or x=="nov":
        dias = 30
    return dias

print(dias_mes (mes, ano))
