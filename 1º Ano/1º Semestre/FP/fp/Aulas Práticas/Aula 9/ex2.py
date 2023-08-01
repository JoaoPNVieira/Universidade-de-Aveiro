from sys import argv
def count():
	dic = {}
	fin = open(argv[1], 'r', encoding='ISO-8859-1')
	for l in fin:
		for c in l:
			if c.isalpha():
				c = c.lower()
				if c in dic:
					dic[c] += 1
				else:
					dic[c] = 1
	return dic

dic = count()

for a in dic:
	print(a, "-->", dic[a]) 
				
