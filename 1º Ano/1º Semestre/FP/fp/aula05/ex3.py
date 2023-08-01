nn = int(input("Qual é o n que iremos fatorizar?"))
def fac(n):
	y = n
	while n>1:
		y = y * (n-1)
		n = n-1 
	return y 
print("A fatorização de", nn, "é", fac(nn), ".")
		
