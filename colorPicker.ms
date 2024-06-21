sensor clear switch1 @enabled
jump drawcolor equal clear 1

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


op sub x x 3.25
op sub y y 2.25
op sub x 0 x
op sub y 0 y
op mul x x 32.5
op mul y y 32.5
# récupère la couleur a partir des coordonnées
set red 0
set green 0
set blue 0
color1:
jump color2 greaterThan x 20
jump color2 lessThan x 0
jump color2 greaterThan y 20
jump color2 lessThan y 0
read red cell1 15
read green cell1 16
read blue cell1 17
jump endSelectColor always
color2:
jump color3 greaterThan x 40
jump color3 lessThan x 20
jump color3 greaterThan y 20
jump color3 lessThan y 0
read red cell1 18
read green cell1 19
read blue cell1 20
jump endSelectColor always
color3:
jump color4 greaterThan x 60
jump color4 lessThan x 40
jump color4 greaterThan y 20
jump color4 lessThan y 0
set red 255
set green 255
set blue 255
jump endSelectColor always
color4:
jump color5 greaterThan x 80
jump color5 lessThan x 60
jump color5 greaterThan y 20
jump color5 lessThan y 0
set red 0
set green 0
set blue 0
jump endSelectColor always
color5:
jump color6 greaterThan x 20
jump color6 lessThan x 0
jump color6 greaterThan y 40
jump color6 lessThan y 20
read red cell1 3
read green cell1 4
read blue cell1 5
jump endSelectColor always
color6:
jump color7 greaterThan x 40
jump color7 lessThan x 20
jump color7 greaterThan y 40
jump color7 lessThan y 20
read red cell1 6
read green cell1 7
read blue cell1 8
jump endSelectColor always
color7:
jump color8 greaterThan x 60
jump color8 lessThan x 40
jump color8 greaterThan y 40
jump color8 lessThan y 20
read red cell1 9
read green cell1 10
read blue cell1 11
jump endSelectColor always
color8:
jump menu greaterThan x 80
jump menu lessThan x 60
jump menu greaterThan y 40
jump menu lessThan y 20
read red cell1 12
read green cell1 13
read blue cell1 14
jump endSelectColor always


menu:
# si on clique sur le gradation de couleur rouge
jump gradRed greaterThan x 20
jump gradRed lessThan x 0
jump gradRed greaterThan y 80
jump gradRed lessThan y 40
# calcul de la couleur rouge
op sub rY y 40
op div rY rY 40
op mul rY rY 255
set red rY
write red cell1 0
jump gradSelectColor always


gradRed:
# si on clique sur le gradation de couleur vert
jump gradGreen greaterThan x 40
jump gradGreen lessThan x 10
jump gradGreen greaterThan y 80
jump gradGreen lessThan y 40
# calcul de la couleur vert
op sub gY y 40
op div gY gY 40
op mul gY gY 255
set green gY
write green cell1 1
jump gradSelectColor always


gradGreen:
# si on clique sur le gradation de couleur bleu
jump validColor greaterThan x 60
jump validColor lessThan x 20
jump validColor greaterThan y 80
jump validColor lessThan y 40
# calcul de la couleur bleu
op sub bY y 40
op div bY bY 40
op mul bY bY 255
set blue bY
write blue cell1 2
jump gradSelectColor always
validColor:
jump outScreen greaterThan x 80
jump outScreen lessThan x 60
jump outScreen greaterThan y 60
jump outScreen lessThan y 40
# si on clique sur le bouton valider
# on decale tout les carré de couleur dans la mémoire
read tempRed cell1 0
read tempGreen cell1 1
read tempBlue cell1 2
set i 20
loop-decal:
op sub temp i 3
read tempValue cell1 temp
write tempValue cell1 i
op sub i i 1
jump loop-decal notEqual i 0

write tempRed cell1 21
write tempGreen cell1 22
write tempBlue cell1 23
write 0 cell1 0
write 0 cell1 1
write 0 cell1 2

jump drawcolor always
outScreen:
end

gradSelectColor:
read tempRed cell1 0
read tempGreen cell1 1
read tempBlue cell1 2
draw color tempRed tempGreen tempBlue
draw rect 61 61 19 20 0 0
drawflush display1
end


endSelectColor:
write red cell1 21
write green cell1 22
write blue cell1 23
draw color red green blue
draw rect 61 61 19 20 0 0
drawflush display1
end











drawcolor:
# dessine des carez de couleur de 20x20
draw clear 0 0 0 0 0 0
read r cell1 15
read g cell1 16
read b cell1 17
draw color r g b
draw rect 0 0 20 20 0 0
read r cell1 18
read g cell1 19
read b cell1 20
draw color r g b
draw rect 20 0 20 20 0 0
draw color 255 255 255
draw rect 40 0 20 20 0 0
draw color 0 0 0
draw rect 60 0 20 20 0 0
drawflush display1

read r cell1 3
read g cell1 4
read b cell1 5
draw color r g b
draw rect 0 20 20 20 0 0
read r cell1 6
read g cell1 7
read b cell1 8
draw color r g b
draw rect 20 20 20 20 0 0
read r cell1 9
read g cell1 10
read b cell1 11
draw color r g b
draw rect 40 20 20 20 0 0
read r cell1 12
read g cell1 13
read b cell1 14
draw color r g b
draw rect 60 20 20 20 0 0
drawflush display1


draw color 0 255 204
draw rect 0 40 80 2 0 0
drawflush display1



# gradation de couleur rouge
draw color 0 0 0
draw rect 0 42 20 6 0 0
draw color 51 0 0
draw rect 0 48 20 8 0 0
draw color 102 0 0
draw rect 0 56 20 8 0 0
draw color 153 0 0
draw rect 0 64 20 8 0 0
draw color 204 0 0
draw rect 0 72 20 8 0 0
draw color 255 0 0
draw rect 0 80 20 8 0 0

draw color 0 255 204
draw rect 19 40 2 40 0 0
drawflush display1
# gradation de couleur vert
draw color 0 0 0
draw rect 21 42 19 6 0 0
draw color 0 51 0
draw rect 21 48 19 8 0 0
draw color 0 102 0
draw rect 21 56 19 8 0 0
draw color 0 153 0
draw rect 21 64 19 8 0 0
draw color 0 204 0
draw rect 21 72 19 8 0 0
draw color 0 255 0
draw rect 21 80 19 8 0 0

draw color 0 255 204
draw rect 39 40 2 40 0 0
drawflush display1
# gradation de couleur bleu
draw color 0 0 0

draw rect 41 42 19 6 0 0
draw color 0 0 51
draw rect 41 48 19 8 0 0
draw color 0 0 102
draw rect 41 56 19 8 0 0
draw color 0 0 153
draw rect 41 64 19 8 0 0
draw color 0 0 204
draw rect 41 72 19 8 0 0
draw color 0 0 255
draw rect 41 80 19 8 0 0

draw color 0 255 204
draw rect 59 40 2 40 0 0

drawflush display1
draw color 0 255 204
draw rect 59 59 49 2 0 0

read tempRed cell1 0
read tempGreen cell1 1
read tempBlue cell1 2
draw color tempRed tempGreen tempBlue
draw rect 61 61 19 20 0 0
drawflush display1
draw color 0 255 0 
draw rect 61 42 19 17 0 0
draw color 0 0 0
draw stroke 2
draw line 70 50 65 55 0 0
draw line 70 50 75 55 0 0

drawflush display1
