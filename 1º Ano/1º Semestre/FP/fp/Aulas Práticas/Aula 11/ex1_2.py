#fase 1
def readFile ():
    f = open('file.txt', 'r', encoding="utf-8")
    wordsList = []
    for i in f:
        for p in i.split():
            p = p.rstrip(',.!').lower()
            if p not in wordsList:
                wordsList.append(p)
    f.close()
    return wordsList

print(readFile())

#fase 2
def readFileSorted ():
        f = open('file.txt', 'r', encoding="utf-8")
        wordsList = []
        for i in f:
            for p in i.split():
                p = p.rstrip(',.!').lower()
                if p not in wordsList:
                    wordsList.append(p)
        wordsListSorted = sorted(wordsList)
        f.close()
        return wordsListSorted

print("\nLista de palavras ordenada:\n")
print(readFileSorted())

#fase 3
def readFileOccurrencies ():
    f = open('file.txt', 'r', encoding="utf-8")
    ocurrenciesDict = {}
    for i in f:
        for p in i.split():
            p = p.rstrip(',.!').lower()
            if p not in ocurrenciesDict:
                ocurrenciesDict[p] = 1
            else:
                ocurrenciesDict[p] += 1
    f.close()
    return ocurrenciesDict

print("\nDicionário com ocorrências:\n")
print(readFileOccurrencies())


#fase 4
def readFileOccurrenciesSortedInversly ():
        f = open('file.txt', 'r', encoding="utf-8")
        ocurrenciesDict = {}
        for i in f:
            for p in i.split():
                p = p.rstrip(',.!').lower()
                if p not in ocurrenciesDict:
                    ocurrenciesDict[p] = 1
                else:
                    ocurrenciesDict[p] += 1

        ocurrenciesDictInverted = {}
        for i2 in ocurrenciesDict:
            val = ocurrenciesDict[i2]
            if val not in ocurrenciesDictInverted:
                ocurrenciesDictInverted[val] = [i2]
            else:
                ocurrenciesDictInverted[val].append(i2)
        f.close()

        listOfWordOcurrenciesInverslySorted = []
        for a in ocurrenciesDictInverted:
            
        return ocurrenciesDictInverted

print("\n\n")
print(readFileOccurrenciesSortedInversly())
