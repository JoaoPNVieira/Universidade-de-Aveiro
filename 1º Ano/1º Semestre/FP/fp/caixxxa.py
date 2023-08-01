def fileop():
	fi = open('BaseDados.txt', 'r')
	bd = {}
	al = {}
	for line in fi:
		code,name,area,price,iva = line.split(';')
		#pprice = float(price[:1] + ',' + price[2:])
		for a in iva: 
			if a == '%':
				z = iva.index(a)
				iiva = float(iva[:z])
		bd[code] = [name, area, float(price), iiva]
		al[code] = area
	return bd, al
		
def Insertt(a):
	fullprice = 0
	itemlist = {}
	pricelist = {}
	num = str(input('Qual o numero do artigo?, bitch'))
	while num != '0-zero':
		if num in a.keys():
			price = a[num][2] + a[num][2] * (a[num][3] / 100)
			print(a[num][0], ':', price)
			fullprice+=price
			if num in itemlist.keys():
				itemlist[num] += 1 
			else: 
				itemlist[num] = 1 
			if num not in pricelist.keys():
				pricelist[num] = price	
			num = str(input('Qual o numero do artigo?, bitch'))
				
	return fullprice, itemlist, pricelist

def fact(il, bd, c):
	fullorddic = {}
	while len(fullorddic) < 4:
		for sec in bd.values():
				fullorddic[sec] = ''
	for i in il.keys():
		for f in bd.keys():
			if i == f:
				while il[i] > 0:
					fullorddic[bd[f]] += str(i) + '  ' + str(c[i])
					il[i] -= 1 
	return fullorddic
		


def main():
	bD,aL = fileop()
	print (bD)
	print(aL)
	a = 0
	print('(I)nserir!itens \n'
	'(F)acturar \n'
	'(S)air')
	op = str(input('whaz it gon be chief?'))
	while op != 'S':
		if op == 'I':
			a,b,c = Insertt(bD)
			op = str(input('whaz it gon be chief?'))
		if op == 'F':
			fac =fact(b, aL, c)
			for f in fac.keys(): 
				print(f + ': \n')
				print(fac[f])

main()
