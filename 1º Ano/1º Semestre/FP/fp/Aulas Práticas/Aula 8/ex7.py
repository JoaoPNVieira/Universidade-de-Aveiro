#a) function that asks for the teams
def teams(n):
    teams = []
    while True:
        x = input(n)
        if x == "0":
            break
        teams.append(x)
    return teams


#b) function that creates all te champ's games
def games(n):
    gamesList = []
    for eq1 in n:
        for eq2 in n:
            if eq1 != eq2:
                gamesList.append((eq1, eq2))
    return gamesList


#c) function that creates a ditionary with all the results
def results(n):
    results = {}
    for i in n:
        print()
        print(i[0] + " - " + i[1])
        eq1 = int(input("Número de golos da equipa {}: ".format(i[0])))
        eq2 = int(input("Número de golos da equipa {}: ".format(i[1])))
        results[i] = (eq1, eq2)
    return results


#d) function that does all the math to calculate the final results
def scores(n, t):
    #scores = {team: [vitorias, derrotas, empates, golos marcados, golos sofridos, pontos]}
    scores = {}
    for team in t:
        scores[team] = [0, 0, 0, 0, 0, 0]
    for i in n:
        if n[i][0] > n[i][1]:
            scores[i[0]][0] += 1
            scores[i[1]][1] += 1
            scores[i[0]][5] += 3
        elif n[i][0] < n[i][1]:
            scores[i[0]][1] += 1
            scores[i[1]][0] += 1
            scores[i[1]][5] += 3
        else:
            scores[i[0]][2] += 1
            scores[i[1]][2] += 1
            scores[i[0]][5] += 1
            scores[i[1]][5] += 1
        scores[i[0]][3] += n[i][0]
        scores[i[0]][4] += n[i][1]
        scores[i[1]][3] += n[i][1]
        scores[i[1]][4] += n[i][0]
    return scores

def resultsTable(scoresDict):
    print("\n\n   <-- RESULTADOS -->\n")
    print("{:^12s} | {:^12s} | {:^12s} | {:^12s} | {:^16s} | {:^16s} | {:^12s}".format("Equipa", "Vitórias", "Derrotas", "Empates", "Golos Marcados", "Golos Sofridos", "Pontos"))
    for i in scoresDict:
        print("{:^12s} | {:^12s} | {:^12s} | {:^12s} | {:^16s} | {:^16s} | {:^12s}".format(i, str(scoresDict[i][0]), str(scoresDict[i][1]), str(scoresDict[i][2]), str(scoresDict[i][3]), str(scoresDict[i][4]), str(scoresDict[i][5])))


#e) function that given the scores' dictionay determinates who is the winner
# def winner(scoresDict, t):
#     winnersList = []
#     control = scoresDict[t[0]][5]
#     for i in scoresDict:
#         if scoresDict[i][5] >= control:
#             winnersList.append(i)
#             control = scoresDict[i][5]
#     return winnersList
#ISTO NÃO ESTÁ BEM!!! PENSAR COM CALMA --> DEPOIS DE ACABAR O SEMESTRE CARALHOOOOOOOOOOO


# MAIN
footballTeams = teams("Insira uma nova equipa (prima 0 para terminar a introdução de equipas): ")
matches = games(footballTeams)
matchesResults = results(matches)
print(matchesResults)
champScore = scores(matchesResults, footballTeams)
resultsTable(champScore)
listOfWinners = winner(champScore, footballTeams)
print(listOfWinners)
