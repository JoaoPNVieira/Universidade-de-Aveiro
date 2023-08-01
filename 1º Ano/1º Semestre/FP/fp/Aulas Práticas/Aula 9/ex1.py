def soma():
	fin = open("nums.txt" , 'r')
	soma = 0
	for l in fin:
		soma += float(l.rstrip())
		#print("-->",soma)
	return soma
	
print("Soma:", soma())
