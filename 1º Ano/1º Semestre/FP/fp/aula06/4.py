allTeams = ["FCP", "SLB", "SCP", "Vitoria", "Setubal", "Braga", "Academica"]
print(allTeams)
def mmatches(testList):
	matchBoard = []
	for team in testList:
		teamI = allTeams.index(team)
		nOfTeams = len(testList) 
		otherTeamIndex = 0
		listOtherTeamIndex= []
		while otherTeamIndex < nOfTeams:
			if otherTeamIndex != teamI:
				listOtherTeamIndex.append(otherTeamIndex)
				otherTeamIndex += 1
			else:
				otherTeamIndex += 1 
		for n in listOtherTeamIndex: 
			matchess = (allTeams[teamI], "x", allTeams[n])
			matchBoard.append(matchess)
	return matchBoard
print(mmatches(allTeams))


	
