Ano = int(input("Qual é o ano?"))
Mes = int(input("Qual é o mes?"))
Dia = int(input("Que dia é hoje?"))
mess = Mes
diav = Dia - 1
diavv = Dia + 1
anov = Ano - 1
anovv = Ano + 1 
messv = mess
messvv = mess
if Mes in [1, 3, 5, 7, 8, 10, 12]: 
	print(31)
elif Mes in [4, 6, 9, 11]:
	print(30)
else: 
	if Ano%4==0 or (Ano%100==0 and Ano%400==0) : 
		print(29)
	else: 
		print(28)
if Mes == 1:
	mess = "Janeiro"
elif Mes == 2: 
	mess = "Fevereiro"
elif Mes == 3: 
	mess = "Março"
elif Mes == 4: 
	mess = "Abril"
elif Mes == 5: 
	mess = "Maio"
elif Mes == 6: 
	mess = "Junho"
elif Mes == 7: 
	mess = "Julho"
elif Mes == 8: 
	mess = "Agosto"
elif Mes == 9: 
	mess = "Setembro"
elif Mes == 10: 
	mess = "Outubro"
elif Mes == 11: 
	mess = "Novembro"
elif Mes == 12: 
	mess = "Dezembro"
if Dia == 1:
	Dia = diav
	mess = messv
	Ano = anov
	if Mes == 1:
		messv = "Dezembro"
		diav = 31
		anov = Ano - 1
	elif Mes == 2:
		messv = "Janeiro"
		diav = 31
	elif Mes == 3:
		messv = "Fevereiro"
		diav = 31
	elif Mes == 4:
		messv = "Março"
		diav = 31
	elif Mes == 5:
		messv = "Abril"
		diav = 31
	elif Mes == 6:
		messv = "Maio"
		diav = 31
	elif Mes == 7:
		messv = "Junho"
		diav = 31
	elif Mes == 8:
		messv = "Julho"
		diav = 31
	elif Mes == 9:
		messv = "Agosto"
		diav = 31
	elif Mes == 10:
		messv = "Setembro"
		diav = 31
	elif Mes == 11:
		messv = "Outubro"
		diav = 31
	elif Mes == 12:
		messv = "Novembro"
		diav = 31
if Dia == 31: 
	Dia = diavv
	mess = messvv
	Ano = anovv
	if Mes == 1:
		messvv = "Fevereiro"
		diavv = 1
	elif Mes == 3:
		messvv = "Abril"
		diavv = 1
	elif Mes == 4:
		messvv = "Maio"
		diavv = 1
	elif Mes == 5:
		messvv = "Junho"
		diavv = 1
	elif Mes == 6:
		messvv = "Julho"
		diavv = 1
	elif Mes == 7:
		messvv = "Agosto"
		diavv = 1
	elif Mes == 8:
		messvv = "Setembro"
		diavv = 1
	elif Mes == 9:
		messvv = "Outubro"
		diavv = 1
	elif Mes == 10:
		messvv = "Novembro"
		diavv = 1
	elif Mes == 11:
		messvv = "Dezembro"
		diavv = 1
	elif Mes == 12:
		messvv = "Janeiro"
		diavv = 1
		anovv = Ano + 1
if Ano%4==0 or (Ano%100==0 and Ano%400==0):
	if Mes == 2:
		if Dia == 29: 
			Dia = diavv
			mess = messvv
			messvv = "Março"
			diavv = 1
else: 
	if Mes == 2:
		if Dia == 28: 
			Dia = diavv
			mess = messvv
			messvv = "Março"
			diavv = 1

print("Bom dia, hoje é dia", Dia, "de", mess, "do ano", Ano, ". Ontem foi dia", Dia, "de", mess, "do ano", Ano, "e amanha será dia", Dia, "de", mess, "do ano", Ano, ".")



