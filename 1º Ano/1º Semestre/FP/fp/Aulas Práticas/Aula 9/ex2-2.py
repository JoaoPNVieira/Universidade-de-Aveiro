import sys

fin = open(sys.argv[1], "r", encoding='ISO-8859-1')
wordsDic = {}
for line in fin:
    for char in line:
        if char.isalpha():
            char = char.lower()
            if char not in wordsDic:
                wordsDic[char] = 0
            wordsDic[char] += 1

for entry in wordsDic:
    print("{} --> {}".format(entry, wordsDic[entry]))
