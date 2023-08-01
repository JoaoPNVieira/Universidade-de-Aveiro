def compareFiles(file1, file2):
    f1 = open(str(file1), "r")
    f2 = open(str(file2), "r")
    control = True
    while True:
        piece1 = f1.read(1024)
        piece2 = f2.read(1024)
        if (not piece1) or (not piece2):
            break
        elif piece1 != piece2:
            control = False
            break
    f1.close()
    f2.close()
    return control


n = compareFiles("texto.txt", "nums.txt")
if n == True:
    print("São iguais!")
else:
    print("Não são iguais...")
