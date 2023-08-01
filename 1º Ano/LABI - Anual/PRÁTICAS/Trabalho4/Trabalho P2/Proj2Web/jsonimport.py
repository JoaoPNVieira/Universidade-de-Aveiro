import json

##-- Lê o ficheiro --##
myjsfile=open('jsonfiles\generate.js', 'r')
jsdata=myjsfile.read()

##-- Passa o ficheiro --##
obj=json.loads(jsdata)

list=obj['generate()']
print(list)

print(obj['generate2()'])
