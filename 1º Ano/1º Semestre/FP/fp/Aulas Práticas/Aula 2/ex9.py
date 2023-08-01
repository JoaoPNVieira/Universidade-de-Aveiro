initialTime = float(input("Insira o tempo (em segundos) que desejar: "))

#To present the number that will be given to us in the following format "hh:mm:ss"
#I have to follow some steps.

#The first step is to convert the number in seconds to hours
#and we will use the the integer part of the result.

timeHour = int(initialTime / 3600)

#The second step is to convert the decimals of the previous result to minutes
#and we will use the the integer part of that second result.

timeMin = int(((initialTime / 3600) - timeHour) * 60)

# The third step is to convert the decimals of the previous result to seconds
#and we will use the the rounded result.

timeSec = (((initialTime / 3600) - timeHour) * 60 - timeMin) * 60

# The last step is to present the result.

print("O número que introduziu (em segundos) corresponde a " + str(timeHour) + ":" + str(timeMin) + ":{0:d} no formato hh:mm:ss.".format(round(timeSec)))

