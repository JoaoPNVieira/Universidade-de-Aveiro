#a
def lii():
	l=[]
	n = input("Numeros da lista")
	while n != "":
		l.append(n)
		n = input("Numeros da lista")
	return l
listt=lii()
print(listt)
#b
def countL():
	minn=listt[0]
	for n in listt:
		if n < minn:
			minn=n
	return minn
minimo = countL()
print(minimo)
#c
def minmax():
	minn=listt[0]
	maxx=listt[0]
	for n in listt:
		if n < minn:
			minn = n 
		if n > maxx:
			maxx = n
	lminmax = [minn, maxx]
	return lminmax
minmaxp=minmax()
print(minmaxp)
#d
med = (float(minmaxp[0]) + float(minmaxp[1])) / 2
print(med)
numlmed=[]
for n in listt: 
	if float(n) < med:
		numlmed.append(n)
print(numlmed)
		

			
		

	
