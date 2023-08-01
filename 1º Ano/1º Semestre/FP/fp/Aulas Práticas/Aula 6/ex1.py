lista = [-10, -9, -8, -7, -6, -5, -4, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print("a)")
def length (lista):
    contagem = 0
    for i in lista:
        contagem += 1
    return contagem

print(length(lista))


print("\nb)")
def criarLista():
    lista = []
    while (True):
        x = input("Introduza um número: ")
        if x == "":
            break
        else:
            lista.append(int(x))
    return lista

print(criarLista())


print("\nc)")
def soma (lista):
    soma = 0
    for i in lista:
        soma += i
    return soma

print("A soma de todos os elementos de", lista, "é:", soma(lista))


print("\nd)")
def countElementsInferiorThan (lista, n):
    count = 0
    for i in lista:
        if i < n:
            count += 1
    return count

k=-1
print("Números menores que ",k,":",countElementsInferiorThan(lista,k))

print("\ne)")
def maximo (lista):
    maximo = 0
    for i in lista:
        if i > maximo:
            maximo = i
    return maximo

print("O máximo da lista", lista,"é:", maximo(lista))


print("\nf)")
def funcao ():
    n = criarLista()
    x = maximo(n)
    print("A lista introduzia foi:",n)
    print("O valor máximo da lista é:",x)
    print("Números menores que",x/2,":",countElementsInferiorThan(n, x/2))
funcao()


print("\ng)")

lista1 =[1, 2, 3, 4, 5, 6]
x = 2
y = 100
def substituicao(lista1, x, y):
    lista2 = []
    for i in range(length(lista1)):
        if lista1[i] == x:
            lista2.append(y)
        else:
            lista2.append(lista1[i])
    return lista2

print(substituicao(lista1, x, y))

print("\nh)")

def inverterOrdem(lista1):
    lista2 = []
    for i in range(length(lista1)-1, -1, -1):
        lista2.append(lista1[i])
    return lista2

print(inverterOrdem(lista1))
