    #a)
listaN = []
listaC = []
def readFx():
	l=[]
	b = open('school.txt', 'r')
	for line in b:
		c,d,e,f,g,h,i = line.split(',')
		listaN.append(c)
		listaC.append(b)
		tline = (c.strip(), d.strip(), e.strip(), f.strip(), g.strip(), h.strip(), i.strip())
		l.append(tline)
	b.close()
	return(l)
print(readFx())
    
    #b)
def calcFx():
	l = []
	b = open('school.txt', 'r')
	z = b.readline()
	for line in b:
		c,d,e,f,g,h,i = line.split(',')
		linha = line[1].split
		med = (float(g.strip()) + float(h.strip()) + float(i.strip())) / 3
		l.append('%.2f' %med)
	b.close()
	return (l)
print(calcFx())
        
	#c)
def drawTable():
	readFx()
	listaNota = calcFx()
	output1 = ''
	output2 = ''
	output3 = ''
	con = 0
	output1 += str(listaN[con]) + '\t' + str(listaC[con]) + '\t' + 'Nota Final'
	con += 1
	output2 += str(listaN[con]) + '\t' + str(listaC[con]) + '\t' + str(listaNota[con - 1])
	con += 1
	output3 += str(listaN[con]) + '\t' + str(listaC[con]) + '\t' + str(listaNota[con - 1])
	print(output1)
	print(output2)
	print(output3)
drawTable()	
	
