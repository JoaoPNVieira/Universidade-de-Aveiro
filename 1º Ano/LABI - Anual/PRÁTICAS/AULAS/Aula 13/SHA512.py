#encoding=utf-8
import hashlib
import sys

# FUNÇÃO DE SINTESE SHA-1:

inFile = open(sys.argv[1],'r')
buffer = inFile.read()

h = hashlib.sha1()
h.update(buffer.encode('utf-8'))
print(h.hexdigest())
