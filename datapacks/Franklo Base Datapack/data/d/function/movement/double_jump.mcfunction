execute unless block ~ ~-1 ~ #translucent run tag @a add epic_dj
execute unless block ~ ~-1 ~ #translucent run playsound item.trident.thunder player @s ~ ~ ~ 0.5 2 1
execute if block ~ ~-1 ~ #translucent run effect give @s levitation 1 14 true
execute unless block ~ ~-1 ~ #translucent run effect give @s levitation 1 19 true
tag @s add dj
scoreboard players reset @s dj_detect
scoreboard players remove @s stamina 40
scoreboard players set @s dj_time 10
item replace entity @s armor.chest with elytra[hide_additional_tooltip={},hide_tooltip={},damage=433]
playsound custom.double_jump player @s ~ ~ ~ 0.5 1 1