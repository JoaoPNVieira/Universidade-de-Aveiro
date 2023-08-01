import os
from sys import argv


def walk(name):
    newList = []

    for root, dirs, files in os.walk(str(name), topdown=False):
        for name in os.listdir(name):
            newList.append(os.path.join(root, name))

    return newList


n = walk(argv[1])

for entry in n:
    print("{} --> {}".format(entry,os.stat(entry).st_size))
