import os
from sys import argv

def walk(dirname, extension):
    newList = []

    for root, dirs, files in os.walk(str(dirname), topdown=False):
        for name in os.listdir(dirname):
            if name.endswith(str(extension)):
                newList.append(os.path.join(root, name))

    return newList


filesList = walk(argv[1], argv[2])

for entry in filesList:
    print(entry)
