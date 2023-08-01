equipas = ["FCP", "SLB", "SCP"]

def confrontos (n):
    jogos = []
    for firstTeam in n:
        for secondTeam in n:
            if firstTeam != secondTeam:
                jogos.append(firstTeam + " --> " + secondTeam)
    return jogos

print("Lista de confrontos:\n-->", confrontos(equipas))
