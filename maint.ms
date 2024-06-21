read red cell1 21
read green cell1 22
read blue cell1 23
read size cell1 24
read rotate cell1 25

op div size size 2

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
op add y y 0.75

op sub x 0 x
op sub y 0 y
op mul x x 32.5
op mul y y 32.5
jump end lessThan y -10
jump end greaterThan y 200
jump end lessThan x -30
jump end greaterThan x 200
# draw clear 0 0 0 0 0 0
draw color red green blue 0 0 0 0 0 0

draw poly x y 4 size rotate 0
drawflush display1
end:
end

