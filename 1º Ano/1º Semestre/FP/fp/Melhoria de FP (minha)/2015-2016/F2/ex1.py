def triagem():
    log = {}
    fin = open("pacientes.json", "r")
    # A MINHA FORMA!
    # for i in fin:
    #     doentes = {}
    #     i = i.strip().strip("{").strip("}").split(",")
    #     for a in i:
    #         a = a.split(":")
    #         a[0] = a[0].strip("\"").strip(" \"")
    #         a[1] = a[1].strip(" [").strip("]").strip("\"")
    #         if a[0] not in doentes:
    #             doentes[a[0]] = ""
    #         doentes[a[0]] = a[1]
        # print(doentes)
    doentes = eval(fin.read().rstrip())
    # UMA FORMA MIL VEZES MELHOR!!!!!!
    fin.close()
    sintomas = {"Vermelho": ("queimaduras com mais de 25%", "trauma cranio encefalico", "desconforto respiratorio grave", "dor no peito associada a falta de ar"),
    "Laranja": ("cefaleia intensa", "dor severa", "hemorragia moderada", "arritmia"),
    "Amarelo": ("convulsao", "desmaios", "vomitos intensos", "crise de panico"),
    "Verde" : ("estado febril", "dor leve", "nausea e tontura", "torcicolo"),
    "Azul": ("aplicacao de medicacao", "queixa cronica sem alteracoes")}
    for a in doentes:
        for b in sintomas:
            if doentes[a][0].lower() in sintomas[b]:
                if a not in log:
                    log[a] = ""
                log[a] = b
    return (log, doentes)

def ordenar(dicTri):
    newDic = {}
    for i in dicTri:
        if dicTri[i] == "Vermelho":
            n = "1"
        elif dicTri[i] == "Laranja":
            n = "2"
        elif dicTri[i] == "Amarelo":
            n = "3"
        elif dicTri[i] == "Verde":
            n = "4"
        else:
            n = "5"
        newDic[i] = n
    newList = sorted(newDic, key = lambda x: newDic[x])
    return newList

def tempo_espera(dicDoentes):
    tempoDoentes = {}
    tempo = {}
    fin = open("sintomas.csv", "r")
    for i in fin:
        i = i.rstrip().rsplit(",")
        if i[0] not in tempo:
            tempo[i[0]] = ""
        tempo[i[0]] = i[1]
    fin.close()
    for a in dicDoentes:
        if a not in tempoDoentes:
            tempoDoentes[a] = 0
        if "h" in tempo[dicDoentes[a][0]]:
            time = tempo[dicDoentes[a][0]].rstrip("min").rsplit("h")
            time1 = int(time[0])*60 + int(time[1])
        else:
            time = tempo[dicDoentes[a][0]].rstrip("min")
            time1 = int(time)
        tempoDoentes[a] = time1
    return tempoDoentes

def stats(tempoDoente, dicTriOrdenado, dicTri):
    tempoEspera = 0
    dicEspera = {}
    tempoCor = {}
    corQ = {}
    tempoCorMédio = {"Vermelho": 0, "Laranja": 0, "Amarelo": 0, "Verde": 0, "Azul": 0}
    for i in dicTriOrdenado:
        if i not in dicEspera:
            dicEspera[i] = tempoEspera
        tempoEspera += tempoDoente[i]
    for i in dicTri:
        if dicTri[i] not in tempoCor:
            tempoCor[dicTri[i]] = 0
        tempoCor[dicTri[i]] += dicEspera[i]
        if dicTri[i] not in  corQ:
            corQ[dicTri[i]] = 0
        corQ[dicTri[i]] += 1
    for i in tempoCor:
        tempoCorMédio[i] = tempoCor[i]/corQ[i]
    return(dicEspera, tempoCorMédio)

# MAIN
print("Triagem:")
tri = triagem()
for a in tri[0]:
    print("{} -> {}".format(a, tri[0][a]))

print("\nOrdem de atendimento:")
lista = ordenar(tri[0])
count = 1
for i in lista:
    print("{}º: {}".format(count, i))
    count += 1

print("\nTempo de espera por pacientes:")
tempoDo = tempo_espera(tri[1])
tempo = stats(tempoDo, lista, tri[0])[0]
tempoCor = stats(tempoDo, lista, tri[0])[1]
for i in tempo:
    print("{}: {}min".format(i, tempo[i]))
print()
print("Tempos Médios por cor:")
for i in tempoCor:
    print("{}: {:.0f}".format(i, tempoCor[i]))
