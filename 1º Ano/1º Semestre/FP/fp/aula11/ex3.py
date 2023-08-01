#
def inputs():
	l = []
	n = input('Adicione um elemento à lista.')
	while n != '':
		l.append(n)
		n = input('Adicione um elemento à lista.')
	return l

def mediana(l):
	lst = sorted(l)
	indL = len(l)
	if indL % 2 == 0: 
		testn = int(indL / 2)
		testn2 = int(testn - 1)
		med = (float(lst[testn]) + float(lst[testn2])) / 2
		return med
	else:
		testnn = indL // 2
		med = lst[testnn]
		return med

l = inputs()
mediana = mediana(l)
print(sorted(l))
print(mediana)

			
