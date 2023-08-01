def repeats(word):
    for index in range(len(word)):
        if index < len(word) - 1:
            if word[index] == word[index+1]:
                return True
    else:
        return False
wordsList = []

fin = open("/usr/share/dict/"+"linux.words" , 'r')
for line in fin:
    line = line.rstrip()
    # print("line --->",line)
    if repeats(line) == True:
        wordsList.append(line)

for word in wordsList:
    print(word)
