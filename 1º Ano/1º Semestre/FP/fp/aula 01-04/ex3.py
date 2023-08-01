message = """
{}, em 2020 farás {} anos.
"""
name = input("Como te chamas?")
age = 2020 - int(input("Em que ano nasceste?"))
print(message.format(name,age))
