#I' going to calculate how many seconds are in 42 minutes and 42 seconds

timeMin = 42
timeSec1 = 42

timeSec2 = timeMin * 60
timeFinal = timeSec2 + timeSec1

print(timeFinal)


#Now I'm going to calculate how many miles are in 10 kilometers

distKm = 10

distMiles = distKm / 1.61

print("")
print(distMiles)

#Now I'm going to calculate my average pace(time per mile in minutes and seconds)
d = 10/1.61
tMin = 42
tSec1 = 42
tSec2 = tMin * tSec1/60
tSec2 = tMin + tSec1/60
tMin2 = tMin + tSec1/60

pace = tMin2 / d
pace1 = tMin2 // d
pace2 = (pace - pace1) * 60
print("My average pace is " + str(pace1) + " min " + str(pace2) + " sec.\n")

#Finally, I'm going to calculate my average speed in miles per hour.

timeFinalHour = timeFinal / 3600

averageSpeed = distMiles / timeFinalHour

print("My average speed is " + str(averageSpeed) + " miles per hour.")