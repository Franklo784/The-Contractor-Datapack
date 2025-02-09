particle dust{color:[0,1,1],scale:1} ~ ~ ~ 0.1 0.1 0.1 0 5 force
particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0 5 force

execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players add .pistol wpn_pierce 1
execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run damage @s 1
execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players remove @s enemy_health 150
execute as @e[tag=enemy,scores={pistol_invul=0},dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players set @s pistol_invul 5

execute as @e[tag=machinegun_grenade,distance=..1] at @s run summon marker ~ ~ ~ {Tags:["player_projectile","machinegun_grenade_explode"]}
execute as @e[tag=machinegun_grenade,distance=..1] at @s run kill @s

execute as @e[tag=coin,distance=..2,tag=!coin_shot] at @s run function d:weapons/shot_coin {dmg:"150",wpn_tag:"pistol"}

execute positioned ^ ^ ^0.3 if block ~ ~ ~ #translucent if entity @s[distance=..15] unless score .pistol wpn_pierce matches 3.. unless entity @e[tag=coin,distance=..0.5] run function d:weapons/raycast/pistol