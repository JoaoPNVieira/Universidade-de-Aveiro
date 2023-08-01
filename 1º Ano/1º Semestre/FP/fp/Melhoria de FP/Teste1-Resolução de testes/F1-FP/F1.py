#encoding:utf8

def read_contador():
	lista=[]
	fin=open("contador")
	
	# popular lista
	for line in fin:
		word = line.strip()
		value = int(word)
		lista.append(value)	
	return lista
	
def kw_semana(lista):
	w_semana = lista[len(lista)-1] - lista[0]
	kw_semana = w_semana/1000
	return kw_semana
	
def preco_kw_semana(kw_semana):
	preco_kw_semana= round(kw_semana * 0.15282,2)
	return preco_kw_semana

def dias_semana(lista):	
	domingo=[]
	segunda=[]
	terca=[]
	quarta=[]
	quinta=[]
	sexta=[]
	sabado=[]
	a=0
	b=25
	for d in range(a,b):
		domingo.append(lista[d])
	a=a+24
	b=b+24
	for s in range(a,b):
		segunda.append(lista[s])
	a=a+24
	b=b+24
	for t in range(a,b):
		terca.append(lista[t])
	a=a+24
	b=b+24
	for q in range(a,b):
		quarta.append(lista[q])
	a=a+24
	b=b+24
	for qui in range(a,b):
		quinta.append(lista[qui])
	a=a+24
	b=b+24
	for sex in range(a,b):
		sexta.append(lista[sex])
	a=a+24
	b=b+24
	for sab in range(a,b):
		sabado.append(lista[sab])
	return segunda, terca, quarta, quinta, sexta, sabado, domingo
	
def ciclo_semana (segunda, terca, quarta, quinta, sexta, sabado, domingo,kw):
	domingo_vazio=(domingo[24]-domingo[22])+(domingo[8]-domingo[0])	
	segunda_vazio=(segunda[24]-segunda[22])+(segunda[8]-segunda[0])
	terca_vazio=(terca[24]-terca[22])+(terca[8]-terca[0])
	quarta_vazio=(quarta[24]-quarta[22])+(quarta[8]-quarta[0])
	quinta_vazio=(quinta[24]-quinta[22])+(quinta[8]-quinta[0])
	sexta_vazio=(sexta[24]-sexta[22])+(sexta[8]-sexta[0])
	sabado_vazio=(sabado[24]-sabado[22])+(sabado[8]-sabado[0])
	semana_vazio = domingo_vazio+terca_vazio+quarta_vazio+quinta_vazio+sexta_vazio+sabado_vazio+segunda_vazio
	semana_vazio = semana_vazio/1000
	semana_nao_vazio = kw-semana_vazio
	preco_semana_vazio=round(semana_vazio * 0.0946,2)
	preco_semana_nao_vazio = round(semana_nao_vazio * 0.1785,2)
	preco_semana_total = preco_semana_nao_vazio + preco_semana_vazio
	
	return semana_vazio, semana_nao_vazio, preco_semana_nao_vazio, preco_semana_vazio, preco_semana_total
	

def ciclo_dia (segunda, terca, quarta, quinta, sexta, sabado, domingo,kw):
	domingo_vazio=(domingo[24]-domingo[0])	
	segunda_vazio=(segunda[7]-segunda[0])
	terca_vazio=(terca[7]-terca[0])
	quarta_vazio=(quarta[7]-quarta[0])
	quinta_vazio=(quinta[7]-quinta[0])
	sexta_vazio=(sexta[7]-sexta[0])
	sabado_vazio=(sabado[24]-sabado[22])+(sabado[18]-sabado[13])+(sabado[10]-sabado[0])
	dia_vazio = domingo_vazio+terca_vazio+quarta_vazio+quinta_vazio+sexta_vazio+sabado_vazio+segunda_vazio
	dia_vazio = dia_vazio/1000
	dia_nao_vazio = kw-dia_vazio
	preco_dia_vazio=round(dia_vazio * 0.0946,2)
	preco_dia_nao_vazio = round(dia_nao_vazio * 0.1785,2)
	preco_dia_total= preco_dia_nao_vazio + preco_dia_vazio
	
	return dia_vazio, dia_nao_vazio, preco_dia_nao_vazio, preco_dia_vazio,preco_dia_total

def ciclo_melhor(preco_dia_total, preco_semana_total,preco_kw_semana):
	pd=preco_dia_total
	ps=preco_semana_total
	ts=preco_kw_semana
	
	if pd < ps and pd<ts:
		melhor = "Tarifa Bi-Horária -ciclo diario"
	if ps < pd and ps <ts:
		melhor = "Tarifa Bi-Horária -ciclo semanal"
	if ts<pd and ts<ps:
		melhor = "Tarifa Simples"
	return melhor
	
	
lista = read_contador()
kw_semana=kw_semana(lista)
preco_kw_semana=preco_kw_semana(kw_semana)
segunda, terca, quarta, quinta, sexta, sabado, domingo = dias_semana(lista)
ciclo_dia(segunda, terca, quarta, quinta, sexta, sabado, domingo,kw_semana)	
preco_dia_total,dia_vazio, dia_nao_vazio, preco_dia_nao_vazio, preco_dia_vazio=ciclo_dia (segunda, terca, quarta, quinta, sexta, sabado, domingo,kw_semana)
preco_semana_total,semana_vazio, semana_nao_vazio, preco_semana_nao_vazio, preco_semana_vazio = ciclo_semana (segunda, terca, quarta, quinta, sexta, sabado, domingo,kw_semana)
melhor=ciclo_melhor(preco_dia_total, preco_semana_total,preco_kw_semana)
print("Tarifa Simples (kWh): {}".format(kw_semana))
print("Tarifa Simples (Euros): {}".format(preco_kw_semana))
print("")
print("Tarifa Bi-Horária -ciclo diario-vazio (kWh): {}".format(dia_vazio))
print("Tarifa Bi-Horária -ciclo diario-vazio (Euros): {}".format(preco_dia_vazio))
print("Tarifa Bi-Horária -ciclo diario-fora vazio (kWh): {}".format(dia_nao_vazio))
print("Tarifa Bi-Horária -ciclo diario-fora vazio (Euros): {}".format(preco_dia_nao_vazio))
print("Tarifa Bi-Horária -ciclo diario-total (Euros): {} ".format(preco_dia_nao_vazio + preco_dia_vazio))
print("")
print("Tarifa Bi-Horária -ciclo semanal-vazio (kWh): {}".format(round(semana_vazio,2)))
print("Tarifa Bi-Horária -ciclo semanal-vazio (Euros): {}".format(preco_semana_vazio))
print("Tarifa Bi-Horária -ciclo semanal-fora vazio (kWh): {}".format(semana_nao_vazio))
print("Tarifa Bi-Horária -ciclo semanal-fora vazio (Euros): {}".format(preco_semana_nao_vazio))
print("Tarifa Bi-Horária -ciclo semanal-total (Euros): {} ".format(round(preco_semana_nao_vazio + preco_semana_vazio,2)))
print("")
print("O melhor ciclo é: {}".format(melhor))

