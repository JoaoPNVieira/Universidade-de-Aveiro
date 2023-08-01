def transposta(matriz):
    novaMatriz = []
    for b in range(len(matriz[0])):
        novaMatriz.append([])
    for i in matriz:
        for a in range(len(i)):
            novaMatriz[a].append(i[a])
    return novaMatriz

t = transposta([[1,2,3,4,5],[5,4,3,2,1],[3,4,5,2,1])
print(t)
