n = int(input('test number?'))
lis = []
for x in range (2, n):
	lis.append(x) 
primeList = lis	
for x in range(2, n):
	con = 2
	while con < ((n+1)/2):
		re = x * con
		if re in lis:
			primeList.remove(re)
			con += 1
		else:
			con += 1
print(primeList)

	
