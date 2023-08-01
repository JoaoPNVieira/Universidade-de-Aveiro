def readf(a):
	filee = open(a, 'r')
	dic = {}
	for line in filee:
		a,b,c = line.split(';')
		dic[a] = [b,c]
	filee.close()
	return dic

fi = readf('1.txt')
bruh = {}
print(fi)
for x in sorted(fi.keys()):
	print(x, fi[x])

for x in sorted(fi.keys()):
	bruh[x] = fi[x]
	
print(bruh)
