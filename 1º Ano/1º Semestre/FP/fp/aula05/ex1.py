conta = 0
soma = 0
line = input("Nº?")
if len(line) > 0 : 
	minimo = maximo = float(line)
while len(line) > 0:
	n = float(line)
	conta = conta + 1
	soma = soma + n 
	if n < minimo:
		minimo = n
	if n > maximo: 
		maximo = n 
	media = soma / conta
	line = input("Nº?")
print("O maximo é", maximo, ", o minimo é", minimo, ", a média é", media, ".")
	

	
