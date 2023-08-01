#Let's calculate how many days
import datetime

userInpt = input("Please enter your birthay (mm/dd/yyyy): ")
birthday = datetime.datetime.strptime(userInpt, "%m/%d/%Y").date()
print(birthday)

currentDate = datetime.date.today()

days = birthday - currentDate
print(days.days, "days")
