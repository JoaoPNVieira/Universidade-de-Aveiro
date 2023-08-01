def inputText(msg):
    n = input(msg)
    return n

def count(var):
    dic = {}
    for i in var:
        i = i.lower()
        if i.isalpha():
            if i not in dic:
                dic[i] = 0
            dic[i] += 1
    return dic

dicChar = count(inputText("Escreva um texto: "))
for el in dicChar:
    print("{} --> {}".format(el, dicChar[el]))
