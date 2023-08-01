def diasMes(mes, ano):
	nDias = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]	
	if mes == 2:
		if ano%400==0 or (ano%4==0 and ano%100!=0):
			return 29
		else:
			return 28
	else:
		return nDias[mes-1]

# ler dados
ano = int(input('ano: ')); mes = int(input('mes: ')); dia = int(input('dia: '))
anoS = anoA = ano; mesS = mesA = mes; diaS = diaA = dia
# avancar um dia
diaS+=1
if diaS > diasMes(mesS, anoS):
	mesS+=1
	diaS=1
if mesS>12:
	anoS+=1
	mesS=1
	diaS=1
print(anoS,mesS, diaS, sep='/')

# recuar um dia
diaA-=1
if diaA == 0:
	mesA-=1
	diaA=diasMes(mesA, anoA)
if mesA==0:
	anoA-=1
	mesA=12
	diaA=31
print(anoA,mesA, diaA, sep='/')
