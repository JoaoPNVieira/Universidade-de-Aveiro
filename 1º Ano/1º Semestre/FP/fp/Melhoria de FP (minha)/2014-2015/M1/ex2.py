fin = open("linux.words", "r")
words = {}
for i in fin:
    i = i.rstrip()
    for c in range(len(i)):
        if c < len(i)-1:
            if i[c] == i[c+1]:
                if i not in words:
                    words[i] = 0
                words[i] += 1

countTotal = 0
for i in words:
    print("{} --> {}".format(i, words[i]))
    countTotal += words[i]

print("Total: {}".format(countTotal))
