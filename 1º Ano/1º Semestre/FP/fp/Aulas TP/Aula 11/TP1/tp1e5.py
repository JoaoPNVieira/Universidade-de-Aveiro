import sys

print(sys.argv)

try:
    f = open(sys.argv[1])
    l = f.readlines()
    print(l)
    f.close()
except OSError:
    print("Erro")

x = int(input('numero? '))

while(True):
    try:
        x = int(input('numero? '))
        break
    except ValueError:
        print('Erro')
    