particle dust{color:[0,1,1],scale:1} ~ ~ ~ 0.1 0.1 0.1 0 5 force
particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0 5 force

execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players add .pistol wpn_pierce 1
execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players remove @s enemy_health 100
execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run damage @s 1
execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players set @s pistol_invul 5

execute positioned ^ ^ ^0.3 if block ~ ~ ~ #translucent if entity @s[distance=..15] unless score .pistol wpn_pierce matches 3.. run function d:weapons/raycast/pistol