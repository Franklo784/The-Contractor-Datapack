#> Stamina

execute as @p[scores={stamina=44}] at @s run playsound custom.recharge player @s ~ ~ ~ 1 1 1
execute as @p[scores={stamina=89}] at @s run playsound custom.recharge player @s ~ ~ ~ 1 1 1
execute as @p[scores={stamina=134}] at @s run playsound custom.recharge player @s ~ ~ ~ 1 1 1

scoreboard players set @p[scores={stamina=44},tag=sliding] stamina 45
scoreboard players set @p[scores={stamina=89},tag=sliding] stamina 90
scoreboard players set @p[scores={stamina=134},tag=sliding] stamina 135

#> Sliding

tag @p[tag=!ingame] remove sliding

execute as @p[tag=ingame,tag=!dj,gamemode=!spectator] at @s rotated ~ 0 unless block ~ ~-1 ~ #translucent if block ^ ^ ^1 #translucent if block ^ ^ ^2 #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} run tag @s add sliding

execute as @p[tag=sliding] at @s unless block ~ ~-.5 ~ #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} run attribute @s movement_speed base set 0.186
execute as @p[tag=sliding] at @s if block ~ ~-.5 ~ #translucent run attribute @s movement_speed base set 0.1

execute as @p[tag=sliding] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:false}}} if block ~ ~-.5 ~ #translucent run attribute @s movement_speed base set 0.1

execute as @p[tag=sliding] at @s if block ~ ~.5 ~ #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:false}}} run attribute @s movement_speed base set 0.1
execute as @p[tag=ingame] at @s if block ~ ~.5 ~ #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:false}}} run tag @s remove sliding

execute as @p[tag=ingame,tag=sliding] at @s rotated ~ 0 unless block ^ ^ ^1 #translucent unless block ^ ^ ^1 snow run attribute @s movement_speed base set 0.1
execute as @p[tag=ingame,tag=sliding] at @s rotated ~ 0 unless block ^ ^ ^1 #translucent unless block ^ ^ ^1 snow run tag @s remove sliding

execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^ ^ ^1 #translucent run attribute @s movement_speed base set 0.1
execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^ ^ ^1 #translucent run tag @p remove sliding
execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^ ^ ^2 #translucent run attribute @s movement_speed base set 0.1
execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^ ^ ^2 #translucent run tag @p remove sliding
execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^0.5 ^ ^1 #translucent run attribute @s movement_speed base set 0.1
execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^0.5 ^ ^1 #translucent run tag @p remove sliding
execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^-0.5 ^ ^1 #translucent run attribute @s movement_speed base set 0.1
execute at @p[tag=sliding] rotated ~ 0 run execute unless block ^-0.5 ^ ^1 #translucent run tag @p remove sliding

attribute @p[tag=!sliding] scale base set 1
attribute @p[tag=sliding] scale base set .5

execute as @p[tag=sliding] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} unless block ~ ~-.5 ~ #translucent run playsound entity.breeze.slide player @s ~ ~ ~ .3 1

execute as @p[tag=sliding] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} unless block ~ ~-.5 ~ #translucent positioned ~ ~.3 ~ positioned ^ ^ ^.8 rotated ~ 0 run function d:particles/slide

execute as @p[tag=sliding] at @s if block ~ ~-1 ~ #translucent run tag @s remove sliding

attribute @p[tag=!sliding] movement_speed base set 0.1

#> Dash

execute as @p[scores={stamina=45..},tag=ingame] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sneaking:true}}} unless score @s dash_cooldown matches 1.. rotated ~ 0 run function d:movement/dash
execute at @p[scores={dash_time=1..}] positioned ~ ~1 ~ positioned ^ ^ ^0.5 run function d:particles/dash1
execute at @p[scores={dash_time=1..}] positioned ~ ~1 ~ positioned ^ ^ ^1 run function d:particles/dash2

#> Double Jump

clear @p[nbt=!{Inventory:[{id:"minecraft:elytra"}]},tag=ingame] elytra
item replace entity @p[tag=ingame,tag=has_dj,tag=!dj,scores={stamina=45..,dj_time=0}] armor.chest with elytra[hide_additional_tooltip={},hide_tooltip={},unbreakable={}]
item replace entity @p[tag=ingame,tag=has_dj,scores={stamina=..44}] armor.chest with elytra[hide_additional_tooltip={},hide_tooltip={},damage=433]
item replace entity @p[tag=ingame,tag=has_dj,tag=dj] armor.chest with elytra[hide_additional_tooltip={},hide_tooltip={},damage=433]

execute as @p[scores={dj_detect=1..,stamina=45..}] at @s run function d:movement/double_jump
execute as @p[tag=dj,nbt={OnGround:1b}] run tag @s remove dj
execute as @p[scores={dj_time=1..},nbt={OnGround:0b}] run tag @s add dj
execute at @p[scores={dj_time=1..}] positioned ~ ~1 ~ rotated 0 90 run function d:particles/double_jump
execute at @p[scores={dj_time=1..},tag=epic_dj] positioned ~ ~0.5 ~ rotated 0 90 run function d:particles/epic_double_jump
execute at @p[scores={dj_time=1..},tag=epic_dj] positioned ~ ~0.5 ~ rotated ~ 0 run function d:particles/dj_alchemy_circle
execute at @p[scores={dj_time=1..}] anchored eyes positioned ^ ^ ^-1.25 run function d:particles/dj_wings
tag @p[scores={dj_time=0},tag=epic_dj] remove epic_dj
effect clear @p[scores={dj_time=3}] levitation

tag @p[tag=dj] remove sliding