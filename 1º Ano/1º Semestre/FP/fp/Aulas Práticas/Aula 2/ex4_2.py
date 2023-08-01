print("Física e Químca\n")
FQ10 = float(input("Insira a classificação que obteve no 10º ano: "))
FQ11 = float(input("Insira a classificação que obteve no 11º ano: "))

print("\nBiologia e Geologia\n")
BG10 = float(input("Insira a classificação que obteve no 10º ano: "))
BG11 = float(input("Insira a classificação que obteve no 11º ano: "))

print("\nInglês\n")
ING10 = float(input("Insira a classificação que obteve no 10º ano: "))
ING11 = float(input("Insira a classificação que obteve no 11º ano: "))

print("\nFilosofia\n")
FIL10 = float(input("Insira a classificação que obteve no 10º ano: "))
FIL11 = float(input("Insira a classificação que obteve no 11º ano: "))

print("\nPortuguês\n")
PORT10 = float(input("Insira a classificação que obteve no 10º ano: "))
PORT11 = float(input("Insira a classificação que obteve no 11º ano: "))
PORT12 = float(input("Insira a classificação que obteve no 12º ano: "))

print("\nMatemática\n")
MAT10 = float(input("Insira a classificação que obteve no 10º ano: "))
MAt11 = float(input("Insira a classificação que obteve no 11º ano: "))
MAT12 = float(input("Insira a classificação que obteve no 12º ano: "))

print("\nDisciplinas de 12º ano (opções)\n")
OP1 = float(input("Insira a classificação que obteve na 1ª opção: "))
OP2 = float(input("Insira a classificação que obteve na 2ª opção: "))

print("\nExame Nacional\n")
EM = float(input("Insira a classificação que obteve na 1ª fase do Exame Nacional de Matemática: "))

MediaFQ = (FQ10 + FQ11)/2
MediaBG = (BG10 + BG11)/2
MediaING = (ING10 + ING11)/2
MediaFIL = (FIL10 + FIL11)/2
MediaPORT = (PORT10 + PORT11 + PORT12)/3
MediaMAT = (MAT10 + MAt11 + MAT12)/3

MediaInterna = (MediaFQ + MediaBG + MediaING + MediaFIL + MediaPORT + MediaMAT + OP1 + OP2)/8
print(MediaInterna)
MediaFinal = (MediaInterna + EM)/2

print("A sua média de entrada na Licenciatura de Engenharia Informática da UA com o\nExame Nacional de Matemátca como única prova de ingresso foi: " + str(MediaFinal))