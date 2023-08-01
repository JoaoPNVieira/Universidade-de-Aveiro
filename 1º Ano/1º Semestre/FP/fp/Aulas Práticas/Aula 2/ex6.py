message = """
Caro/a {},

Bem-vindo/a à disciplina de Fundamentos de Programação.
Esperamos que aprendas muito e que te divirtas a fazê-lo.
Vamos torcer para que consigas {} valores, ou mais!

Cumprimentos,

Os Profes de FP.
"""

name = str(input("Como te chamas? "))
name = name.capitalize()
grade = input("Que nota esperas conseguir em FP? ")

print(message.format(name, grade))
