def makeL():
	n = input('Add a number to the list')
	lst = []
	while n != '':
		lst.append(n)
		n = input('Add a number to the list')
	return lst 

k = makeL()
print(k)
	
def CountLower(lst, v):
	lowLst = []
	for n in lst: 
		if int(n) < v: 
			lowLst.append(n)
	return lowLst
print(CountLower(k,2))

def minMax(lst):
	minn = lst[0]
	maxx = lst[0]
	for x in lst: 
		if int(x) < int(minn):
			minn = x
		elif int(x) > int(maxx):
			maxx = x
	return minn,maxx
	
print(minMax(k))

def medd(lst):
	ll = []
	minmax = minMax(lst)
	med = (int(minmax[0]) + int(minmax[1])) / 2 
	for x in lst: 
		if float(x) < float(med):
			ll.append(x)
	return ll
print(medd(k))
			
