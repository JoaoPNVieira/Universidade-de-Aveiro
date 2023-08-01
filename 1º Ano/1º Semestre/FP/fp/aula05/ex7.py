a = int(input("Qual é o numero que iremos testar?"))
def isprime(n) : 
	r = n//2 + 1
	while r > 1: 
		q = n % r 
		if q == 0:
			z = 1
			break
		else: 
			r = r - 1
			if r == 1:
				z = 0
			else:
				continue
	if n==1 or n == 2:
		z = 0 
	if z == 1: 
		return("False")
	else: 
		return("True")
print(isprime(a))
