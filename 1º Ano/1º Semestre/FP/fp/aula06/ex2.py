l = []
n = input("Quais os termos da lista?")
while n != "":
	l.append(int(n))
	n = input("Quais os termos da lista?")
print(l)
def lc(lst, v):
	k = []
	x = 0 
	while x <= len(lst):
		if v > lst[x]:
			k.append(lst[x])
			x += 1
		else:
			x += 1
	return k
r = int(input("Qual o numero de teste?"))
cont = lc(l, r)
print(cont)
def minmax(lst):
	x=0
	
		

	
