# encoding=utf-8
import os.path
import sys

print("Gosto de LABI")
sys.stdout.write("MAS:  \n")

#Terminal> python3 (Corre python3 em modo "interactivo")

#Terminal> "ctrl+D" (Stop python3 interactivo)

#NOTA: Pôr enconding no inicio, se não o phyton3 não conhece 
#characteres porque é retardado

a = "ODEIO";
b = " Python";

print(a+b);

print("Inicio! Calcular diferentes operações para os seguintes valores:")
c = 2;
d = 3;
e = 5.2;

soma = c+d;
soma2 = c+e;
mult = c*d;
mult2 = c*e;
div = c/d; #dá 0 porque são int's e o Python é retardado e não faz conv auto ou aviso
div2 = c/e;
div3 = c//e;
resdiv = c%d;

print(soma, soma2, mult, mult2, div, div2, div3, resdiv);

a1 = "Laboratórios"
a2 = "de"
a3 = "Informatica" #se uma letra tiver acento, o acento tb é contado como character

print(len(a3)) #comprimento da string a2
print(a1+a2+a3)
print(a1[0:3]+"-"+a3[0]+" "+str(2021)) #Print: Lab-I 2021

asd = a1 + str(c) #str(c) vai imprimir o valor 2 como string permitindo soma
print(asd)


#----- FUNÇÕES DE STRINGS -----#
f = "Uma frase de teste 2020.";
print("\nFUNÇÕES DE STRINGS:")
print(len(f)) 		# Comprimento de uma String
print(f.lower()) 	# Conversão para minúsculas
print(f.upper())	# Conversão para maiusculas
print(f.title())	# Conversão para Título
print(f.find("t"))	# Encontra 1ª posição do char "t"
print(f.isalpha())	# Verifica se só tem letras
print(f.isdigit())	# Verifica se é número
print(f.islower())	# Verifica se tem só minúsculas
print(f.isupper())	# Verifica se tem só maiúsculas
print(f.strip())	# Remove espaços nos extremos
print(f.split(" "))	# Divide string por espaços

#---- %s %d ----#
equipa1 = "Benfica"
equipa2 = "Porto"
golos1 = 4
golos2 = 0
print("\n %s %d, %s %d" % (equipa1, golos1, equipa2, golos2)) # %s - string | %d - int digit

#---- CONVERSÕES VALORES E STRINGS ----#
print("\n Conversões entre Valores e Strings:")
a = 3
sa = str(3)
b = int(sa)
c = float(sa) * 1.2
print("\n %d, %s, %d, %4.2f" % (a, sa, b, c))

#---- LISTAS ----#
print("LISTAS:") #Dimensões dinâmicas
g = ['MIECT','LEI','MEI','MSI','MIEET']
print(g)
print(g[0])
print(g[0:3]) # elementos de l de index 0 até 3 com saltos de 1

print("MAIS FUNÇÕES DE LISTAS:")
l = []
l1 = []
l2 = []
l1.append('MIECT')
l1.append('LEI')
l1.append('MEI')
l2.append('MSI')
l2.append('MIEET')
l.extend(l1)
l.extend(l2)
print(len(l)) # Lista l extende elementos de l1 (3) + l2 (2) tendo um total de 5
print(l)

if g==l:
    print("true")
else :
    print("fake")

s = l.sort()
print(l)

print("SYS.ARGV")
print(sys.argv) # Imprime path?


#---- DICIONÁRIOS ----#
print("DICIONÁRIOS:")
d = []
d.append( {'nome': "Catarina",'mec': 4534} )
d.append( {'nome': "Pedro",'mec': 1234} )
d.append( {'nome': "Joana",'mec': 5354} )
d.append( {'nome': "Miguel",'mec': 6543} )
print(d[0]['nome'])
print(d) # Cada aluno é um dicionáriocom nome e número mecanográfico


#---- USER INPUT ----#
print("USER INPUT")
valor1 = float(input("Primeiro Valor: "))
valor2 = float(input("Segundo Valor: "))

print("Resultado:%f*%f=%f" % ( valor1, valor2, valor1*valor2))

#---- CICLOS IF ----#
print("CICLOS IF:")
a = 3
if not(a % 2):
    print("Par")
else:
    print("Impar")

#---- CLICLOS FOR ----#
print("CICLOS FOR")
a = "Laboratórios de Informática"
for i in a:
    print(i)

#---- CICLOS WHILE ----#
print("CICLOS WHILE:")
i = 0
while i < 10:
    print(i)
    i = i + 1

#---- FUNÇÕES ----#
print("FUNÇÕES DEF")
def pares(a, b):
    c = 0
    i = a
    while i < b:
        if i % 2 == 0:
            c = c + 1
        i = i + 1
    return c

print(pares(1,11)) # valor 11 no final para contar o numero 10 (range 0-10, onde 11 não conta)

#---- FICHEIROS ----#
print("FICHEIROS:")
f = open("texto.txt", "r")
while True: # Forma de escrever c/ciclo while
    linha = f.readline()
    if linha == '':
        break
    print(linha)

for linha in f: # Forma de escrever c/ciclo for
    print(linha)

f.close() # fechar sempre o ficheiro

#---- VERIFICAR SE É FICHEIRO OU DIRECTÓRIO ----#
print("VERIFICAR SE É FICHEIRO OU DIRECTÓRIO:")
fname = "Ficheiro.txt"
if not os.path.exists(fname):
    sys.exit("Não existe")
if os.path.isdir(fname):
    sys.exit("É diretório")
if not os.path.isfile(fname):
    sys.exit("Não é ficheiro")

f = open(fname,"r")