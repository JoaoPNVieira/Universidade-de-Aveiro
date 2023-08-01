def inputText(msg):
    n = input(msg)
    return n

def count(var):
    dic = {}
    words = var.rsplit(" ")
    for word in words:
        word = word.lower()
        if word.isalpha():
            if  word not in dic:
                dic[word] = 0
            dic[word] += 1
    return dic

wordsDict = count(inputText("Escreva: "))
for entry in wordsDict:
    print("{} --> {}".format(entry, wordsDict[entry]))
