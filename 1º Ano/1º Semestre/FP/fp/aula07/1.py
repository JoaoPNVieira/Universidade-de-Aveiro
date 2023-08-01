ficheiro = open('ficheiro1', 'r')
som = 0 
for line in ficheiro:
    som = som + float(line)
ficheiro.close()
print(som) 
