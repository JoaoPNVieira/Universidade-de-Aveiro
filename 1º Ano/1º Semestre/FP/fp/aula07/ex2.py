# Exercise 5 on "How to think...", ch. 11.

import turtle

t = turtle.Turtle()

fic = open('mystery.txt', 'r')
for line in fic:
    if line.strip() == "UP":
        t.up()
    elif line.strip() == "DOWN":
        t.down()
    else:
        coords = line.split()
        x = int(coords[0].strip())
        y = int(coords[1].strip())
        t.goto(x,y)
        
f.close()
# wait 
turtle.Screen().exitonclick()
