def readf(fic):
	fich = open(str(fic), 'r')
	bd = {}
	matl = {}
	for line in fich:
		(mat,marca,niff) = line.rstrip().split(';')
		if niff not in bd:
			bd[niff]= []
		bd[niff].append((mat, marca))
		if niff not in matl:
			matl[niff]= []
		matl[niff].append(mat)
	return bd, matl
a,b = readf('bi.txt')
print(a)
print(b)

		
def printvei(vei):
	veisort = sorted(vei, key=lambda x:(x, vei[x][0]))
	for i in veisort:
		print('{} : {}'.format(i, vei[i]))
		
#def printmat(vei):
	#for i in vei: 
		#print('{} : {}'.format(i , vei[i][0]))

printvei(a)
#printmat(b)
