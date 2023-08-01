fic = open('names.txt', 'r', encoding="latin1")
dic = {}
for line in fic: 
	s = line.strip()
	print(s)
	if s[-1] in dic.keys():
		dic[s[-1]].append(s[0])
	else:
		dic[s[-1]] = [s[0]]
print(dic)
