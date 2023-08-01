def ler():
    fin = open("lusiadas.txt", "r", encoding="ISO-8859-1")
    string = ""
    for i in fin:
        string += i
    return string

def filter(string, stringSearch):
    string = string.split("\n")
    final = ""
    newString = []
    for i in string:
        if i != '':
            newString.append(i)
    for a in newString:
        if stringSearch in a:
            final += a+"\n"
    return final
stri = ler()
print(filter(stri, "barões"))
