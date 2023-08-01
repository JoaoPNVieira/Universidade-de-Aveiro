    #a)
def readFx():
	l=[]
	b = open('school.txt', 'r')
	z = b.readline()
	for line in b:
		c,d,e,f,g,h,i = line.split(',')
		tline = (c.strip(), d.strip(), e.strip(), f.strip(), g.strip(), h.strip(), i.strip())
		l.append(tline)
	b.close()
	return l
print(readFx)
