#encoding: utf-8
#M1_ex2 - dicionario


def contida(word):
	palavras=[]
	fin = open("dicionario.txt")
	for lines in fin:
		lines=lines.strip()
		#print(lines)
		palavras.append(lines)
	#print(palavras)
	palavrasIn=[]
	c=0
	for lista in palavras:
		if word in lista:
			c+=1
	if c>=2:
		print("Está contida!")
		#print(word)
	else:
		print("Não está contida!")
	return word


def todasRepetidas():
	palavras=[]
	fin = open("dicionario.txt")
	for lines in fin:
		lines=lines.strip()
		#print(lines)
		palavras.append(lines)
	#print(palavras)
	palavrasIn=[]
	
	for word in palavras:
		b=0
		for lista in palavras:
			if word in lista:
				b+=1
		if b>=2:
			palavrasIn.append(word)
	for x in palavrasIn:
		print(x)
		
		
def main():
	word=input("Palavra: ")
	contida(word)
	print("")
	print("------------Ex 2.b-----------")
	print("Todas as palavras repetidas")
	print("")	
	todasRepetidas()
main()
