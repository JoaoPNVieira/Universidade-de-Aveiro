distMetros = 1000

time1 = float(input("Diga quando tempo (em minutos) demorou a percorrer a primeira etapa: "))

time2 = float(input("Diga quando tempo (em minutos) demorou a percorrer a segunda etapa: "))

time1 = time1 * 60
time2 = time2 * 60

velFinal = (2 * distMetros) / (time1 + time2)

print("\nA sua velocidade média final foi: " + str(velFinal) + " metros por segundo.")
