Num = ('23mil456')
#print(len(Num))
def countDigit(test):
	nchar = len(test)
	cont = 0 
	counter = 0
	while cont < nchar:
		nume = test[cont]
		if nume.isdigit() == True: 
			counter += 1
			cont += 1 
		else:
			cont += 1 
	return counter
print(countDigit(Num))

Av = ('Universidade de Aveiro')
def shorten(test):
	nchar = len(test)
	cont = 0 
	counter = ("")
	while cont < nchar:
		nume = test[cont]
		if nume.isupper() == True: 
			counter = counter + nume
			cont += 1 
		else:
			cont += 1 
	return counter
print(shorten(Av))

pali = ('omegagemo')
def ispali(test):
	nchar = len(test)
	print (nchar)
	nchar2 = nchar / 2
	print (nchar2) 
	cont = 0
	counter = 0
	while cont < nchar2:
		kappa = (nchar - 1) - cont 
		if pali[cont] == pali[kappa]: 
			counter += 1 
			cont += 1
		else: 
			cont += 1 
	if counter >= nchar2:
		return ('True')
	else: 
		return ('False') 
print(ispali(pali))
