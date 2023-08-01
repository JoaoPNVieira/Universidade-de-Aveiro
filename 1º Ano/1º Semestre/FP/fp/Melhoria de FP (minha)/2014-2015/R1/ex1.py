def validar(msg):
    while True:
        n = input("{}: ".format(msg))
        try:
            n = float(n)
            if n < 0:
                print("{} inválido(a).".format(msg.rsplit(" ")[2]))
            else:
                break
        except:
            print("{} inválido(a).".format(msg.rsplit(" ")[2]))
    return n

log = {}
count = 1
while True:
    dis = validar("Etapa {} Distância".format(count))
    if dis == 0:
        break
    while True:
        tempo = validar("Etapa {} Tempo".format(count))
        if tempo == 0:
            print("Tempo inválido(a).")
        else:
            break
    log[count] = [dis, tempo]
    count += 1

# print(log)
# n = float(-1)
# print(n)

d = 0
t = 0
for i in log:
    # print(i)
    d += log[i][0]
for i in log:
    t += log[i][1]
print("1) Distância toal: {:.2f}km  Tempo total: {:.2f} horas.".format(d, t))

print("2) Velocidades:")
for i in log:
    print("Etapa {}: {:.1f}km/h".format(i,log[i][0]/log[i][1]))
    log[i].append(log[i][0]/log[i][1])

etapa = 0
d = 0
for i in log:
    if log[i][0] > 0:
        d = log[i][0]
        etapa = i

print("3) Etapa mais longa: {} | Tempo: {:.2f} horas".format(etapa, log[etapa][1]))

consumo = 0
for i in log:
    if 0 < log[i][2] <= 50:
        consumo += (log[i][0]*4.5)/100
    elif 50 < log[i][2] <= 90:
        consumo += (log[i][0]*5.5)/100
    elif log[i][2] > 90:
        consumo += (log[i][0]*7.0)/100

print("4) Consumo total: {:.2f} litros".format(consumo))
