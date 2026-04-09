# 1️⃣ 清除舊身分



tag @a remove thief
tag @a remove villager

# 2️⃣ 隨機選一位小偷
tag @r add thief

# 3️⃣ 其他人是平民
tag @a[tag=!thief] add villager

# 4️⃣ 私訊各自的身分

execute as @a[tag=thief] run title @s subtitle {"text":"躲到最後:)","color":"gray"}
execute as @a[tag=thief] run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 1 1

execute as @a[tag=villager] run title @s subtitle {"text":"找出壞老鼠吧!!","color":"gray"}
execute as @a[tag=villager] run playsound minecraft:entity.villager.ambient master @s ~ ~ ~ 1 1

execute as @a[tag=thief] run title @s title {"text":"🔒 你的身份是 奶酪大盜:(！","color":"red","bold":true}
execute as @a[tag=villager] run title @s title {"text":"🌾 你的身份是 友善的老鼠 :D","color":"green","bold":true}