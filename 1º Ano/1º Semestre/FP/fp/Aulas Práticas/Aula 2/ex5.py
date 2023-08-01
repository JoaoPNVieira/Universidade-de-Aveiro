# O primeiro passo é converter a distância de milhas para quilómetros.

distanceMILHAS = int(10)
distanceKM = distanceMILHAS * 1.61

# O segundo passo é converter o tempo de minutos e segundos para horas.

timeMIN = 43
timeSEC1 = float(timeMIN) * 60
timeSECtotal = timeSEC1 + 30
timeHOURStotal = timeSECtotal / 3600

# O terceiro passo é calcular a velocidade média.

VelMédia = distanceKM / timeHOURStotal

print(VelMédia)
