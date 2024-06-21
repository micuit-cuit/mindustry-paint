sensor clear switch1 @enabled

read red cell1 21
read green cell1 22
read blue cell1 23
read size cell1 24
read rotate cell1 25
op div size size 2
print size
print "\n"
print rotate
printflush message1
jump end equal clear 1
set cRed 0
set cGreen 0
set cBlue 0
# si la couleur rgb est trop sombre, on la met en blanc
jump notSombre greaterThan red 127
jump notSombre greaterThan green 127
jump notSombre greaterThan blue 127
set cRed 255
set cGreen 255
set cBlue 255
notSombre:
draw clear cRed cGreen cBlue 0 0 0

# dessine un carré de couleur de size x size au centre de l'écran
draw color red green blue 0 0 0 0 0 0
draw poly 40 40 4 size rotate 0
drawflush display2

sensor onClick arc1 @shooting
jump onClick notEqual onClick false
end
onClick:

sensor shootX arc1 @shootX
sensor shootY arc1 @shootY
sensor posX arc1 @x
sensor posY arc1 @y
op sub x posX shootX
op sub y posY shootY
op sub x x 0.25
op sub y y 5.25
op sub x 0 x
op sub y 0 y
op mul x x 32.5
op mul y y 32.5
jump outScreenDectection greaterThan x 80
jump outScreenDectection lessThan x 0
jump outScreenDectection greaterThan y 80
jump outScreenDectection lessThan y 0
op pow x2 x 2
op sqrt x2 x2 x2

write x2 cell1 24

op div y y 80
op mul y y 360

write y cell1 25
outScreenDectection:
end

end:
draw clear red green blue 0 0 0
drawflush display1
control enabled switch1 0 0 0 0
