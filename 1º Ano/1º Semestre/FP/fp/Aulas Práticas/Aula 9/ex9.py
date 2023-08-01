import os
from sys import argv


def walk(name):
    newList = []

    for root, dirs, files in os.walk(str(name), topdown=False):
        for name in os.listdir(name):
            newList.append(os.path.join(root, name))

    return newList


n = walk(argv[1])
newDic = {}
for entry in n:
    entry1 = entry.rsplit("/")
    if os.stat(entry).st_size not in newDic:
        newDic[os.stat(entry).st_size] = []
    newDic[os.stat(entry).st_size].append(entry1[len(entry1)-1])


print(newDic)
