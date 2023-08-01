valores = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def mediana(lista):
    lista = sorted(lista)
    if len(lista) % 2 == 0:
        mediana = (lista[int(len(lista)/2)-1] + lista[int(len(lista)/2)]) / 2
    else:
        mediana = lista[int(len(lista)/2)]
    return mediana


print(mediana(valores))
