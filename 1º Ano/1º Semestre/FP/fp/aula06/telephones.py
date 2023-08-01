def telToName(tel, telList, nameList):
	if tel in telList:
		tn = telList.index(tel)
		name = nameList[tn]
	if tel not in telList:
		name = tel
	return name



def nameToTels(partName, telList, nameList):
	tels = []
	for name in nameList:
		if partName in name:
				ni = nameList.index(name)
				tels.append(telList[ni])
	return tels

# Lists of telephone numbers and names
telList = ['975318642', '234000111', '777888333', '911911911']
nameList = ['Angelina', 'Brad', 'Claudia', 'Bruna']

# Test telToName:
tel = input("Tel number? ")
print( telToName(tel, telList, nameList) )
print( telToName('234000111', telList, nameList) == "Brad" )
print( telToName('222333444', telList, nameList) == "222333444" )

# Test nameToTels:
partName = input("Name? ")
print( nameToTels(partName, telList, nameList) )
print( nameToTels('Clau', telList, nameList) == ['777888333'] )
print( nameToTels('Br', telList, nameList) == ['234000111', '911911911'] )

