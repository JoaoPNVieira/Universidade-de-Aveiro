import datetime
currentDate = datetime.date.today()

# strftime allows you to specificy the fate format

# %d --> day
# %b --> complete month (like "October")
# %Y --> complete year (like "2017")
print(currentDate.strftime("%d, %B, %Y"))
# %b --> small month (like "Oct")
# %y --> small year (like "17")
print(currentDate.strftime("%d, %b, %y"))
