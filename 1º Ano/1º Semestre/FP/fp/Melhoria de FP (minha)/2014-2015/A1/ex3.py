fin = open("passos.txt", "r")
passos = 0
kmSemana = 0
count = 1
calSemana = 0

for i in fin:
    passosDia = int(i.strip())
    passos += passosDia
    km = (passosDia*1.2)/1000
    kmSemana += km
    cal = km*32
    calSemana += cal
    print()
    print("Dia {}:".format(count))
    print("Km percorridos: {}".format(km))
    print("Calorias gastas: {}".format(cal))
    count += 1

print("Total km percorridos numa semana: {}".format(kmSemana))
print("Média de Calorias consumidas por dias: {}".format(calSemana/7))
