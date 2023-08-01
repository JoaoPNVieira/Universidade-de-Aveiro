a = []
b = []
listnum1 = input("Escolha numeros para a lista a")
while listnum1 != "":
	a.append(listnum1)
	listnum1 = input("Escolha numeros para a lista a")
listnum2 = input("Escolha numeros para a lista b")
while listnum2 != "":
	b.append(listnum2)
	listnum2 = input("Escolha numeros para a lista b")
l = []
for n in a: 
	if n in b:
		if n not in l:
			l.append(n)
print(l)
		
