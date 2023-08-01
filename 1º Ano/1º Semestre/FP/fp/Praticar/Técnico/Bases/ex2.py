print("We will calculate your average speed.")

dist = float(input("How many kilimoters did you went? "))
time = float(input("How long did you take to dod it (minutes?) "))

averageSpeedKmH = dist / (time/60)
averageSpeedMS = (dist*1000) / (time*60)

print("Your average speed was: {0:.1f}".format(averageSpeedKmH),"Km/h.")
print("Your average speed was: {0:.1f}".format(averageSpeedMS),"m/s.")
