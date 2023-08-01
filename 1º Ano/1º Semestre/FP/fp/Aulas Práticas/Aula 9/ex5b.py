def repeats(word):
    count = 0
    for index in range(len(word)):
        if index < len(word) - 1:
            if word[index] == word[index+1]:
                count += 1
    return count


wordsDict = {}

fin = open("/usr/share/dict/"+"linux.words" , 'r')
for line in fin:
    line = line.rstrip()
    # print("line --->",line)
    # print(repeats(line))
    y = repeats(line)
    if y > 0:
        wordsDict[line] = y


totalCount = 0
for word in wordsDict:
    print(word, "-->", wordsDict[word])
    totalCount += wordsDict[word]

print("Total Count -->", totalCount)

# "/usr/share/dict/"+"linux.words"
