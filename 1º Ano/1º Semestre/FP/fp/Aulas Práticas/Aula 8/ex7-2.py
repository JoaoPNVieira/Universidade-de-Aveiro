def inputEquipas():
    equipas = []
    while True:
        n = input("Insira uma nova equipa (prima 0 para terminar a introdução de equipas): ")
        if n == "0":
            break
        equipas.append(n)
    return equipas

def confrontos(teamsList):
    matches = []
    for team1 in teamsList:
        for team2 in teamsList:
            if team1 != team2:
                 matches.append((team1, team2))
    return matches

def resultados(gamesList):
    resultadosDic = {}
    for game in gamesList:
        print()
        print("{} - {}".format(game[0], game[1]))
        res1 = input("Nº de Golos de {}: ".format(game[0]))
        res2 = input("Nº de Golos de {}: ".format(game[1]))
        resultadosDic[game] = (res1, res2)
    return resultadosDic

def pontos(resultsDict, teamsList):
    #pontosDict = {team: [vitorias, derrotas, empates, golos marcados, golos sofridos, pontos]}
    pontosDic = {}
    for team in teamsList:
        pontosDic[team] = [0, 0, 0, 0, 0, 0]
    for entry in resultsDict:
        if resultsDict[entry][0] == resultsDict[entry][1]:
            pontosDic[entry[0]][2] += 1
            pontosDic[entry[1]][2] += 1
            pontosDic[entry[0]][5] += 1
            pontosDic[entry[1]][5] += 1


        if resultsDict[entry][0] > resultsDict[entry][1]:
            pontosDic[entry[0]][0] += 1
            pontosDic[entry[1]][1] += 1
            pontosDic[entry[0]][5] += 3

        if resultsDict[entry][0] < resultsDict[entry][1]:
            pontosDic[entry[0]][1] += 1
            pontosDic[entry[1]][0] += 1
            pontosDic[entry[1]][5] += 3

        pontosDic[entry[0]][3] += int(resultsDict[entry][0])
        pontosDic[entry[0]][4] += int(resultsDict[entry][1])
        pontosDic[entry[1]][3] += int(resultsDict[entry][1])
        pontosDic[entry[1]][4] += int(resultsDict[entry][0])
    return pontosDic

def decisao(pontosDic):
    teams = list(pontosDic.keys())
    winnerIsh = teams[0]
    winnersList = [winnerIsh]
    #print(winnersList)
    for team in pontosDic:
        if team not in winnersList:
            if pontosDic[team][5] > pontosDic[winnerIsh][5]:
                winnersList.append(team)
                if winnerIsh in winnersList:
                    winnersList.remove(winnerIsh)
                winnerIsh = team
            elif pontosDic[team][5] == pontosDic[winnerIsh][5]:
                winnersList.append(team)
    return winnersList

def main():
    listaEquipas = inputEquipas()
    listaJogos = confrontos(listaEquipas)
    #print(listaJogos)
    resultadosDict = resultados(listaJogos)
    #print(resultadosDict)
    pontosDict = pontos(resultadosDict, listaEquipas)
    #print(pontosDict)
    vencedoresList = decisao(pontosDict)
    if len(vencedoresList) == 1:
        vencedor = vencedoresList[0]
    else:
        vencedor = vencedoresList

    print("O vecendor do campeonato é {}".format(vencedor))


main()
