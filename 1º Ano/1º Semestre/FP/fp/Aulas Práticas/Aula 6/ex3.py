equipas = ["FCP", "SLB", "SCP"]

def confrontos (equipas):
    jogos = []
    for eq1 in equipas:
        for eq2 in equipas:
            if eq1 != eq2:
                jogos.append(eq1 + "-" + eq2)
    return jogos

y = confrontos(equipas)
for i in range (0, len(y)):
    print("Jogo", i+1 , "-->" , y[i])
