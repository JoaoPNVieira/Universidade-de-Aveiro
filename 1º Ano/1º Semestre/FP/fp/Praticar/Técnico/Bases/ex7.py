hours = float(input("Wirte the number of hours you worked this week: "))
salaryPerHour = float(input("How much are you paid for an hour of work? "))

if hours <= 40:
    totalSalary = salaryPerHour * hours
else:
    totalSalary = salaryPerHour * (40) + (salaryPerHour*2) * (hours - 40)

print("The amount of money you will receive this week is ${0:.2f}".format(totalSalary))
