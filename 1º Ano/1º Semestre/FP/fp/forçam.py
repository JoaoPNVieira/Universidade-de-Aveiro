import random
def palavra(f):
	fi=open(f,"r")
	pal=[]
	for line in fi:
		pal.append(line.strip())
	n=random.randint(0,len(pal)-1)
	palavra=pal[n]
	return palavra
def tentativas(pal,s,n):
	v=False	
	if n==0:
		return v
	else:
		l=input(s+ " {} tentativas, Próxima letra?".format(n)).upper()
		if l in pal:
			for i in range(len(pal)):
				if l==pal[i]:
					s=s[:i]+l+s[i+1:]
			if "-" not in s:
				v=True
				return v
			else:
				return tentativas(pal,s,n)
		else:
			return tentativas(pal,s,n-1)
	
def forca():
	f=input("Ficheiro:" )
	pal=palavra(f).upper()
	print(pal)
	s=len(pal)*"-"
	n=9
	v=tentativas(pal,s,n)
	if v:
		print("Parabéns\n"+pal)
	else:
		print("  -------\n  0     |\n/ | \\   |\n / \\    |\n     ___|___\n"+pal)

forca()
