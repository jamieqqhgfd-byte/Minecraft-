execute as @a[tag=dice_temp] run tp @s -3 -60 -19
tag @a[tag=dice_temp] remove dice_temp

execute if entity @a[scores={dice=2}] run schedule function dice:step2/step2 200t
execute unless entity @a[scores={dice=2}] run schedule function dice:step2/step2 1t
