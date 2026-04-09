# 1. 確保有 dice 記分板



# 1. 建立分數欄位（只執行一次即可，可拆出去）
scoreboard objectives add dice dummy

# 2. 所有玩家 dice 重置
scoreboard players set @a dice 0

# 3. 標記 rolling 中的玩家
tag @a add rolling

# 4. 為每個玩家召喚臨時 armor stand（會 spread）
execute as @a[tag=rolling] at @s run summon armor_stand ~ ~ ~ {Tags:["dice_temp"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:0b}

# 5. 對所有 armor stand spread（在自己周圍隨機移動）
spreadplayers ~ ~ 3 8 false @e[tag=dice_temp]

# 6. 根據距離設定點數
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=0.5..1.49,limit=1,sort=nearest] run scoreboard players set @s dice 1
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=1.5..2.49,limit=1,sort=nearest] run scoreboard players set @s dice 2
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=2.5..3.49,limit=1,sort=nearest] run scoreboard players set @s dice 3
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=3.5..4.49,limit=1,sort=nearest] run scoreboard players set @s dice 4
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=4.5..5.49,limit=1,sort=nearest] run scoreboard players set @s dice 5
execute as @a[tag=rolling] at @s if entity @e[tag=dice_temp,distance=5.5..6.5,limit=1,sort=nearest] run scoreboard players set @s dice 6

# 7. 萬一沒有偵測到點數，保底給 1
execute as @a[tag=rolling,scores={dice=0}] run scoreboard players set @s dice 1

# 8. 顯示點數結果（私訊每人）
execute as @a[tag=rolling] run tellraw @s [{"text":"🎲 你擲出了 ","color":"yellow"},{"score":{"name":"*","objective":"dice"},"color":"aqua"},{"text":" 點！","color":"yellow"}]

# 9. 清除 rolling 標籤
tag @a remove rolling

# 10. 清除所有 dice_temp 的 armor stand
kill @e[tag=dice_temp]


schedule function dice:assign_roles 20t
schedule function dice:step1/step1 180t