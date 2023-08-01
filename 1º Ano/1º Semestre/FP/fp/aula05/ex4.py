def fib(n):
	a = 0
	b = 1 
	x = 2
	while x <= n: 
		s = a + b 
		a = b 
		b = s 
		x+=1
	return b
k = int(input("Qaul o termo a calcular?"))
print(fib(k))
