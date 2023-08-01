# -*- encoding: utf8 -*-
# NOME:
# NMEC:
# Use este ficheiro para o exercicio F1

def readFile():
	medidasTotal=[]
	fin = open("contador.txt")
	for lines in fin:
		lines= lines.strip()
		medidasTotal.append(round(int(lines)//1000,2))
	domingo,segunda,terca,quarta,quinta,sexta,sabado = medidasTotal[0:25],medidasTotal[24:49],medidasTotal[48:73],medidasTotal[72:97],medidasTotal[96:121],medidasTotal[120:145],medidasTotal[144:]
	listaDias=[domingo,segunda,terca,quarta,quinta,sexta,sabado]
	#print(listaDias)
	return listaDias

def tarifaSimples(valores):
	c_simples= round(valores[-1][-1]-valores[0][0],2)
	p_simples= c_simples*0.1528
	print ("Tarifa Simples (kWh): {}".format(c_simples))
	print ("Tarifa Simples (Euros): {:0.2f}".format(p_simples))
	return [p_simples, "Tarifa Simples"]

def biHDia(valores):
	c_diario_vazio=0
	c_diario_fora_vazio=0
	for dias in valores:
		c_diario_vazio+= dias[8]-dias[0]+dias[24]-dias[22]
		c_diario_fora_vazio+=dias[22]-dias[8]
	p_diario_vazio=c_diario_vazio*0.0946	
	p_diario_fora_vazio=0.1785	*c_diario_fora_vazio
	p_diario=p_diario_vazio+p_diario_fora_vazio
	print ("Tarifa Bi-Horária - ciclo diario - vazio (kWh): {:0.2f}".format( c_diario_vazio))
	print ("Tarifa Bi-Horária - ciclo diario - vazio (Euros): {:0.2f}".format(p_diario_vazio))
	print ("Tarifa Bi-Horária - ciclo diario - fora-vazio (kWh): {:0.2f}".format( c_diario_fora_vazio))
	print ("Tarifa Bi-Horária - ciclo diario - fora-vazio (Euros): {:0.2f}".format(p_diario_fora_vazio))
	print ("Tarifa Bi-Horária - ciclo diario - Total (Euros): {:0.2f}".format(p_diario))
	return [p_diario, "Tarifa Bi-Horária - ciclo diario"]
	
def biHSem(valores):
	c_semanal_vazio=0
	c_semanal_fora_vazio=0
	for dias in valores[1:6]:
		c_semanal_vazio+= dias[7]-dias[0]
		c_semanal_fora_vazio+=dias[24]-dias[7]
	c_semanal_vazio+= valores[0][24]-valores[0][0]
	c_semanal_vazio+= valores[6][10]-valores[6][0]+valores[6][18]-valores[6][13]+valores[6][24]-valores[6][22]
	c_semanal_fora_vazio+=(valores[6][-1] - valores[6][0]) -( valores[6][10]-valores[6][0]+valores[6][18]-valores[6][13]+valores[6][24]-valores[6][22])
	p_semanal_vazio=c_semanal_vazio*0.0946	
	p_semanal_fora_vazio=0.1785	*c_semanal_fora_vazio
	p_semanal=p_semanal_vazio+p_semanal_fora_vazio
	print ("Tarifa Bi-Horária - ciclo semanal - vazio (kWh): {:0.2f}".format(c_semanal_vazio))
	print ("Tarifa Bi-Horária - ciclo semanal - vazio (Euros): {:0.2f}".format(p_semanal_vazio))
	print ("Tarifa Bi-Horária - ciclo semanal - fora-vazio (kWh): {:0.2f}".format(c_semanal_fora_vazio))
	print ("Tarifa Bi-Horária - ciclo semanal - fora-vazio (Euros): {:0.2f}".format(p_semanal_fora_vazio))
	print ("Tarifa Bi-Horária - ciclo semanal - Total (Euros): {:0.2f}".format(p_semanal))
	return [p_semanal, "Tarifa Bi-Horária - ciclo semanal"]
	
def melhor(simples,diario,semanal):
	valores=[simples[0],diario[0],semanal[0]]
	nomes=[simples[1],diario[1],semanal[1]]
	minimo=valores[0]
	for v in valores:
		if v < minimo:
			minimo=v
	index=-1
	while index < (len(valores)-1):
		index+=1
		if valores[index] == minimo:
			print("{} é o mais apropriado!".format(nomes[index]))
	return minimo
	
	
valores=readFile()
simples=tarifaSimples(valores)
print("")
diario=biHDia(valores)
print("")
semanal=biHSem(valores)
print("")
melhor(simples,diario,semanal)
