# Lista global para o exercício
lista = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5]
print("Lista para o exrcício:\n-->", lista)
print()


#a) função que, dada uma lista, calcula o seu comprimento
def length (n):
    count = 0
    for element in lista:
        count += 1
    return count
print("a) Comprimento da lista:", length(lista))


#b) criação de uma lista através de inputs do utilizador
print("\n")
def criarLista ():
    lista = []
    while True:
        element = input("Escreva um elemento da lista que quer criar:  ")
        if element == "":
            break
        else:
            lista.append(element)
    return lista
lista1 = criarLista()
print("b) A lista criada é:", lista1)


#c) função que soma todos os elementos de uma lista
def somaElementosLista (n):
    soma = 0
    for element in n:
         soma += float(element)
    return soma
print("c) A soma dos elementos da lista criada na alínea é:", somaElementosLista(lista1))


#d) função que conta quantos elementos de uma lista são inferiores a um certo valor
def contagem (n, number):
    count = 0
    for element in n:
        if float(element) < number:
            count += 1
    return count
print("d) O número de elementos menor que 0 é:", contagem(lista1, 0))


#e) função que determina o valor máximo de uma lista numérica
def maximo (n):
    maximo = 0
    for element in n:
        if float(element) > maximo:
            maximo = float(element)
    return maximo
print("e) O valor máximo desta lista é:", maximo(lista1))


#f) programa que lê uma lista de números, diga qual o valor máximo, e conte quantos são inferiores a metade do valor máximo
maximo = maximo(lista1)
contagem = contagem(lista1, maximo/2)
print("O valor máximo desta lista é: ", maximo, ". Existem ", contagem, " número(s) inferior(es) a ", maximo/2, sep = "")


#g) função que, dada uma lista, um elemento x e outro elemento y, devolve uma lista semelhante à de entrada, na qual cada ocorrência de x é substituída por y
def troca(lista, x, y):
    lista2 = []
    for i in lista:
        if x == i:
            lista2.append(y)
        else:
            lista2.append(i)
    return lista2
print("A nova lista é:", troca(lista1, "2", "100"))

#h) função que, dada uma lista, devolve uma lista com os mesmos elementos por ordem inversa
def ordemInversa (n):
    lista3 = []
    for i in range(len(n)-1, -1, -1):
        lista3.append(n[i])
    return lista3
print("A lista é:", ordemInversa(lista1))
