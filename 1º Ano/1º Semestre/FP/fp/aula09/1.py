def openFic(fic):
	f = open(fic, 'r', encoding='UTF-8')
	lst = []
	for line in f: 
		lst.append(line)
	f.close()
	return lst
	
def makeLower(lst):
	l = []
	for line in lst:
		for ele in line:
			le = ele.lower()
			l.append(le)
	return(l)
	
def countL(fic):
	letterDict = {}
	for ele in fic:
		if ele.isalpha():
			if ele in letterDict:
				letterDict[ele] += 1
			else:
				letterDict[ele] = 1
	return letterDict

#def ordDict(dictt):  #ordenar por letra
	#for k in sorted(dictt):
		#print(k, dictt[k])
	
def ordDict(dictt):
	for k,v in sorted(dictt.items(), reverse = True, key = lambda x:x[1]):
		print(k, v)
			
lList = openFic('pg3333.txt')
loList = makeLower(lList)
finalList = countL(loList)
printList = ordDict(finalList)


