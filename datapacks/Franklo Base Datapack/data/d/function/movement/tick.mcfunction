#> Stamina

execute as @a[scores={stamina=39}] at @s run playsound custom.recharge player @s ~ ~ ~ 1 1 1
execute as @a[scores={stamina=79}] at @s run playsound custom.recharge player @s ~ ~ ~ 1 1 1
execute as @a[scores={stamina=119}] at @s run playsound custom.recharge player @s ~ ~ ~ 1 1 1

execute at @a[scores={dash_time=1..}] positioned ~ ~1 ~ positioned ^ ^ ^0.5 run function d:particles/double_jump

scoreboard players set @a[scores={stamina=39},tag=sliding] stamina 40
scoreboard players set @a[scores={stamina=79},tag=sliding] stamina 80
scoreboard players set @a[scores={stamina=119},tag=sliding] stamina 120

#> Sliding

tag @a[tag=!ingame] remove sliding

execute as @a[tag=ingame,tag=!dj] at @s rotated ~ 0 unless block ~ ~-1 ~ #translucent if block ^ ^ ^1 #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} run tag @s add sliding
execute as @a[tag=ingame,tag=!dj] at @s rotated ~ 0 unless block ~ ~-1 ~ #translucent if block ^ ^ ^1 snow if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} run tag @s add sliding

execute as @a[tag=sliding] at @s unless block ~ ~-.5 ~ #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} run effect give @s speed 1 0 true
execute as @a[tag=sliding] at @s if block ~ ~-.5 ~ #translucent run effect clear @s speed

execute as @a[tag=sliding] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:false}}} if block ~ ~-.5 ~ #translucent run effect clear @s speed

execute as @a[tag=sliding] at @s if block ~ ~.5 ~ #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:false}}} run effect clear @s speed
execute as @a[tag=ingame] at @s if block ~ ~.5 ~ #translucent if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:false}}} run tag @s remove sliding

execute as @a[tag=ingame,tag=sliding] at @s rotated ~ 0 unless block ^ ^ ^1 #translucent unless block ^ ^ ^1 snow run tag @s remove sliding

execute as @a[tag=ingame,tag=sliding] at @s rotated ~ 0 if block ^ ^ ^-1.5 #translucent unless block ^.5 ^ ^ #translucent unless block ^-.5 ^ ^ #translucent run tag @s remove sliding

attribute @p[tag=!sliding] scale base set 1
attribute @p[tag=sliding] scale base set .5

execute as @a[tag=sliding] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} unless block ~ ~-.5 ~ #translucent run playsound entity.breeze.slide player @s ~ ~ ~ .3 1

execute as @a[tag=sliding] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sprinting:true}}} unless block ~ ~-.5 ~ #translucent positioned ~ ~.3 ~ positioned ^ ^ ^.8 rotated ~ 0 run function d:particles/slide

execute as @a[tag=sliding] at @s if block ~ ~-1 ~ #translucent run tag @s remove sliding

#> Dash

execute as @a[scores={stamina=40..},tag=ingame] at @s if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sneaking:true}}} unless score @s dash_cooldown matches 1.. rotated ~ 0 run function d:movement/dash
execute at @a[scores={dash_time=1..}] positioned ~ ~1 ~ positioned ^ ^ ^0.5 run function d:particles/dash1
execute at @a[scores={dash_time=1..}] positioned ~ ~1 ~ positioned ^ ^ ^1 run function d:particles/dash2

#> Double Jump

clear @a[nbt=!{Inventory:[{id:"minecraft:elytra"}]},tag=ingame] elytra
item replace entity @a[tag=ingame,tag=has_dj,tag=!dj,scores={stamina=40..,dj_time=0}] armor.chest with elytra[hide_additional_tooltip={},hide_tooltip={},unbreakable={}]
item replace entity @a[tag=ingame,tag=has_dj,scores={stamina=..39}] armor.chest with elytra[hide_additional_tooltip={},hide_tooltip={},damage=433]
item replace entity @a[tag=ingame,tag=has_dj,tag=dj] armor.chest with elytra[hide_additional_tooltip={},hide_tooltip={},damage=433]

execute as @a[scores={dj_detect=1..,stamina=40..}] at @s run function d:movement/double_jump
execute as @a[tag=dj,nbt={OnGround:1b}] run tag @s remove dj
execute as @a[scores={dj_time=1..},nbt={OnGround:0b}] run tag @s add dj
execute at @a[scores={dj_time=1..}] positioned ~ ~1 ~ rotated 0 90 run function d:particles/double_jump
execute at @a[scores={dj_time=1..},tag=epic_dj] positioned ~ ~0.5 ~ rotated 0 90 run function d:particles/epic_double_jump
execute at @a[scores={dj_time=1..},tag=epic_dj] positioned ~ ~0.5 ~ rotated ~ 0 run function d:particles/dj_alchemy_circle
execute at @a[scores={dj_time=1..}] anchored eyes positioned ^ ^ ^-1.25 run function d:particles/dj_wings
tag @a[scores={dj_time=0},tag=epic_dj] remove epic_dj
effect clear @a[scores={dj_time=3}] levitation

tag @a[tag=dj] remove sliding