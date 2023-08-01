def somm():
	f = open('ficheiro1', 'r')
	som = 0
	for line in f:
		linef = line.strip()
		som += float(linef)
	f.close()
	return som 
print(somm())

fic = open('444444', 'w+')
fic.write(str(somm()))
fic.close()
