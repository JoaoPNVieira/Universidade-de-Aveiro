tel = ['938555182', '234567111', '776882333']
nome = ['Angelina', 'Brad', 'Claudia']

#a) função que, dado um número de telefone (e as duas listas), devolve o nome respetivo (ou o próprio número, se não estiver na lista)
number = input("Escreva um número de telefone: ")
def telemovel (number, tel, nome):
    for i in range(0, len(tel)):
        if number == tel[i]:
            contact = nome[i]
            break
    else:
        contact = number
    return contact
print("a) Contacto -->", telemovel(number, tel, nome))


#b)função que, dado a parte de um nome, devolve a lista dos números correspondentes a nomes que incluem essa parte
search = input("Escreva o que quer procurar: ")
def contactsList (search, tel, nome):
    correspondentNumbers = []
    for i in range(len(nome)):
        if search.upper() in nome[i].upper():
            correspondentNumbers.append(tel[i])
    return correspondentNumbers
print("b) Lista de números associados à pesquisa:", contactsList(search, tel, nome))
