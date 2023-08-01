dic = {}
fin = open("DNA_seq.txt", "r")
for i in fin:
    i = i.rstrip()
    for a in range(0, len(i), 3):
        # print(i[a:a+3])
        if i[a:a+3] not in dic:
            dic[i[a:a+3]] = 0
        dic[i[a:a+3]] += 1


newList = sorted(dic, key=lambda x: dic[x], reverse=True)
print(newList)



# print(dic)
for entry in newList:
    print("{} ({}):".format(entry, dic[entry]),end=" ")
    for i in range(dic[entry]):
        print("#", end="")
    print()
print(len(dic))
