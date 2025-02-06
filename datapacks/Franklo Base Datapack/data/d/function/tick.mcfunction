#> Attributes

effect give @a saturation 1 0 true

effect give @a regeneration infinite 255 true
effect give @a water_breathing infinite 255 true

attribute @p[tag=ingame] movement_speed base set 0.185
attribute @p[tag=ingame] jump_strength base set 0.735
attribute @p[tag=ingame] water_movement_efficiency base set 1
attribute @p[tag=ingame] safe_fall_distance base set 690

attribute @p[tag=!ingame] movement_speed base set 0.1
attribute @p[tag=!ingame] jump_strength base set 0.41999998688697815
attribute @p[tag=!ingame] water_movement_efficiency base set 0
attribute @p[tag=!ingame] safe_fall_distance base set 3

#> Health Stuff

execute unless score @p player_health matches 1..15 run worldborder warning distance 0
execute if score @p player_health matches 6..15 run worldborder warning distance 80000000
execute if score @p player_health matches 1..5 run worldborder warning distance 999999999

#> Item Kills

kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Weapons:1b}}}}]

#> Scoreboards

# Players Add

scoreboard players add @e[tag=projectile] projectile_lifetime 1

scoreboard players add @a[scores={stamina=..119},tag=!sliding] stamina 1

# Players Remove

scoreboard players remove @a[scores={dash_cooldown=1..}] dash_cooldown 1

scoreboard players remove @a[scores={dash_time=1..}] dash_time 1

scoreboard players remove @a[scores={dj_time=1..}] dj_time 1

scoreboard players remove @a[scores={sword_cooldown=1..}] sword_cooldown 1

scoreboard players remove @a[scores={player_invul=1..}] player_invul 1

scoreboard players remove @a[scores={pistol_invul=1..}] pistol_invul 1
scoreboard players remove @a[scores={machinegun_invul=1..}] machinegun_invul 1
scoreboard players remove @a[scores={machinegun_alt_invul=1..}] machinegun_alt_invul 1

# Make Sure score exists

execute as @a unless score @s equipped_pistol matches 0.. run scoreboard players set @s equipped_pistol 0
execute as @a unless score @s equipped_machinegun matches 0.. run scoreboard players set @s equipped_machinegun 0
execute as @a unless score @s equipped_shotgun matches 0.. run scoreboard players set @s equipped_shotgun 0

execute as @a unless score @s sub_weapon matches 0.. run scoreboard players set @s sub_weapon 0

execute as @a unless score @s sword_cooldown matches 0.. run scoreboard players set @s sword_cooldown 0

execute as @a unless score @s stamina matches 0.. run scoreboard players set @s stamina 0
execute unless score @p dj_time matches 0.. run scoreboard players set @a dj_time 0

execute as @a unless score @s player_health matches 0.. run scoreboard players set @s player_health 100
execute as @a unless score @s player_invul matches 0.. run scoreboard players set @s player_invul 0

execute as @e[tag=enemy] unless score @s pistol_invul matches 0.. run scoreboard players set @s pistol_invul 0
execute as @e[tag=enemy] unless score @s machinegun_invul matches 0.. run scoreboard players set @s machinegun_invul 0
execute as @e[tag=enemy] unless score @s machinegun_alt_invul matches 0.. run scoreboard players set @s machinegun_alt_invul 0

# Others

scoreboard players set @a[scores={player_health=101..}] player_health 100