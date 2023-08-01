import os
from sys import argv


def walk(name, extension):
    newList = []

    for root, dirs, files in os.walk(str(name), topdown=False):
        for name in os.listdir(name):
            if name.endswith(str(extension)):
                newList.append(os.path.join(root, name))

    return newList


n = walk(argv[1], argv[2])

for entry in n:
    print(entry)
