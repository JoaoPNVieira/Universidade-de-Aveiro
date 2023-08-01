#Primeiro vamos calcular quantos metros o elevador percorre por dia e depois converter
#esse resultado em quilómetros.

distRésChão = 4 * 3
dist1Andar = 4 * 3*2
dist2Andar = 4 * 3*3
dist3Andar = 4 * 3*4

distTotalMetros = distRésChão + dist1Andar + dist2Andar + dist3Andar

distTotalKm = distTotalMetros / 1000

#Agora vamos calcular quantos Km o elevador percorre num ano supondo que todos os anos
#têm 365 dias.

distAnoKm = distTotalKm * 365

# E, por fim, vamos ver quantas horas esteve o elevador a funcionar, num ano.

timeAnoHoras = (distAnoKm * 1000) / 3600

print("Num ano, o elevador percorre " + str(distAnoKm) + " quilómetros e esteve em funcionamento durante " + str(timeAnoHoras) + " horas.")