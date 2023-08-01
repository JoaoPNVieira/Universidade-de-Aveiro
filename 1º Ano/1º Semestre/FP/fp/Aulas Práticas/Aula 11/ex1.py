# def readFile():
#     f = open('file.txt', 'r', encoding="utf-8")
#     wordsList = []
#     for i in f:
#         for p in i.split()  :
#             p = p.rstrip(',.!').lower()
#             if p not in wordsList:
#                 wordsList.append(p)
#     print(wordsList)
#     return wordsList
#     f.close()
#
# def wordsListSorted(l):
#     l = sorted(l)
#     for w in l:
#        print(w)
#
# wordsList = readFile()
# wordsListSorted(wordsList)

#now lets do the second part
def readFile():
    f = open('file.txt', 'r', encoding='utf-8')
    wordsDict = {}
    for i in f:
        for p in i.split():
            p = p.rstrip(',.!').lower()
            if p not in wordsDict:
                wordsDict[p] = 1
            else:
                wordsDict[p] += 1
    return wordsDict

def wordsListSorted(l):
    for i in l.values()
    l = sorted(l)
    for w in l:
       print(w)

print(readFile())
wordsListSorted(readFile())
