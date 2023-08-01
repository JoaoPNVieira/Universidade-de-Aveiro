q = int(input("Quantos termos vamos utilizar?"))
def leib(n): 
	b = 1
	x = 0
	soma = 0
	while x <= n:
		t = 1 / b 
		b = b + 2
		x+=1
		if x == 1:
			soma = t
		elif x % 2 == 0:
			soma = soma - t
		elif  not(x % 2 == 0):
			soma = soma + t
	return soma
r = leib(q) * 4
print("Para", q, "termos de leibniz temos a aproximação é", r, ".")

	
	
