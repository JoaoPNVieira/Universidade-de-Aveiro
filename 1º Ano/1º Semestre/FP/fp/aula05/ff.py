n = int(input("Qaul o numero a analisar?"))
l = []
x = 0
while x < n:
	if (x+1) == n:
		break
	p = n - (x + 1)
	k = n % p
	if k == 0:
		l.append (p)	 
	x += 1
b = sum(l)
print(l) 
if b < n:
	print(n, "é defeciente.")
elif b == n:
	print(n, "é perfeito.")
else: 
	print(n, "é abundante.")
