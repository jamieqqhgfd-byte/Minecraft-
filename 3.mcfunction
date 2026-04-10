




scoreboard objectives add dice dummy


scoreboard players set @a dice 0


tag @a add rolling


execute as @a[tag=rolling] at @s run summon armor_stand ~ ~ ~ {Tags:["dice_temp"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:0b}


spreadplayers ~ ~ 3 8 false @e[tag=dice_temp]


execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=0.5..1.49,limit=1,sort=nearest] run scoreboard players set @s dice 1
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=1.5..2.49,limit=1,sort=nearest] run scoreboard players set @s dice 2
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=2.5..3.49,limit=1,sort=nearest] run scoreboard players set @s dice 3
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=3.5..4.49,limit=1,sort=nearest] run scoreboard players set @s dice 4
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=4.5..5.49,limit=1,sort=nearest] run scoreboard players set @s dice 5
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=5.5..6.5,limit=1,sort=nearest] run scoreboard players set @s dice 6


execute as @a[tag=rolling,scores={dice=0}] run scoreboard players set @s dice 1


execute as @a[tag=rolling] run tellraw @s [{"text":"🎲 你擲出了 ","color":"yellow"},{"score":{"name":"*","objective":"dice"},"color":"aqua"},{"text":" 點！","color":"yellow"}]


tag @a remove rolling

# 10. 清除所有 dice_temp 的 armor stand
kill @e[tag=dice_temp]


schedule function dice:assign_roles 20t
schedule function dice:step1/step1 180t
