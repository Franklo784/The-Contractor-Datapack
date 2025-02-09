#> Attributes

effect give @p saturation 1 0 true

effect give @p regeneration infinite 255 true
effect give @p water_breathing infinite 255 true

attribute @p[tag=ingame] movement_speed base set 0.185
attribute @p[tag=ingame] jump_strength base set 0.735
attribute @p[tag=ingame] water_movement_efficiency base set 1
attribute @p[tag=ingame] safe_fall_distance base set 690
attribute @p[tag=ingame] entity_interaction_range base set 0.000000000000000000000000000000001

attribute @p[tag=!ingame] movement_speed base set 0.1
attribute @p[tag=!ingame] jump_strength base set 0.41999998688697815
attribute @p[tag=!ingame] water_movement_efficiency base set 0
attribute @p[tag=!ingame] safe_fall_distance base set 3
attribute @p[tag=!ingame] entity_interaction_range base set 3

#> Health Stuff

execute unless score @p player_health matches 1..30 run worldborder warning distance 0
execute if score @p player_health matches 6..30 run worldborder warning distance 70000000
execute if score @p player_health matches 6..15 run worldborder warning distance 80000000
execute if score @p player_health matches 1..5 run worldborder warning distance 999999999

#> Item Kills

kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Weapons:1b}}}}]
kill @e[type=arrow]

#> Scoreboards

# Players Add

scoreboard players add @e[tag=projectile] projectile_lifetime 1

scoreboard players add @p[scores={stamina=..119},tag=!sliding] stamina 1

execute unless score @p coin_count matches 4 run scoreboard players add @p coin_refill 1
execute if score @p coin_refill matches 80 run scoreboard players add @p coin_count 1

execute if score @p shotgun_ammo matches ..99 if score .shotgun wpn_cooldown matches 0 run scoreboard players add @p shotgun_ammo 1

# Players Remove

scoreboard players remove @p[scores={projectile_unparriable_timer=1..}] projectile_unparriable_timer 1

scoreboard players remove @p[scores={dash_cooldown=1..}] dash_cooldown 1

scoreboard players remove @p[scores={dash_time=1..}] dash_time 1

scoreboard players remove @p[scores={dj_time=1..}] dj_time 1

scoreboard players remove @p[scores={sword_cooldown=1..}] sword_cooldown 1

scoreboard players remove @p[scores={player_invul=1..}] player_invul 1

scoreboard players remove @e[scores={sword_invul=1..}] sword_invul 1
scoreboard players remove @e[scores={parry_invul=1..}] parry_invul 1
scoreboard players remove @e[scores={pistol_invul=1..}] pistol_invul 1
scoreboard players remove @e[scores={pistol_alt_invul=1..}] pistol_alt_invul 1
scoreboard players remove @e[scores={machinegun_invul=1..}] machinegun_invul 1
scoreboard players remove @e[scores={machinegun_alt_invul=1..}] machinegun_alt_invul 1
scoreboard players remove @e[scores={shotgun_invul=1..}] shotgun_invul 1

# Players Reset

execute if score @p coin_refill matches 80 run scoreboard players reset @p coin_refill

# Make Sure score exists

execute as @e[tag=enemy_projectile] unless score @s projectile_unparriable_timer matches 0.. run scoreboard players set @s projectile_unparriable_timer 0

execute as @p unless score @s equipped_pistol matches 0.. run scoreboard players set @s equipped_pistol 0
execute as @p unless score @s equipped_machinegun matches 0.. run scoreboard players set @s equipped_machinegun 0
execute as @p unless score @s equipped_shotgun matches 0.. run scoreboard players set @s equipped_shotgun 0

execute as @p unless score @s sub_weapon matches 0.. run scoreboard players set @s sub_weapon 0

execute as @p unless score @s sword_cooldown matches 0.. run scoreboard players set @s sword_cooldown 0

execute as @p unless score @s stamina matches 0.. run scoreboard players set @s stamina 0
execute unless score @p dj_time matches 0.. run scoreboard players set @p dj_time 0

execute as @p unless score @s player_health matches 0.. run scoreboard players set @s player_health 100
execute as @p unless score @s player_invul matches 0.. run scoreboard players set @s player_invul 0

execute as @p unless score @s coin_count matches 0.. run scoreboard players set @s coin_count 4
execute as @p if score @s coin_count matches 5.. run scoreboard players set @s coin_count 4

execute as @p unless score @s coin_refill matches 0.. run scoreboard players set @s coin_refill 0

execute as @p unless score @s shotgun_ammo matches 0.. run scoreboard players set @s shotgun_ammo 100

execute as @e[tag=enemy] unless score @s sword_invul matches 0.. run scoreboard players set @s sword_invul 0
execute as @e[tag=enemy] unless score @s parry_invul matches 0.. run scoreboard players set @s parry_invul 0
execute as @e[tag=enemy] unless score @s pistol_invul matches 0.. run scoreboard players set @s pistol_invul 0
execute as @e[tag=enemy] unless score @s pistol_alt_invul matches 0.. run scoreboard players set @s pistol_alt_invul 0
execute as @e[tag=enemy] unless score @s machinegun_invul matches 0.. run scoreboard players set @s machinegun_invul 0
execute as @e[tag=enemy] unless score @s machinegun_alt_invul matches 0.. run scoreboard players set @s machinegun_alt_invul 0
execute as @e[tag=enemy] unless score @s shotgun_invul matches 0.. run scoreboard players set @s shotgun_invul 0

# Others

scoreboard players set @p[scores={player_health=101..}] player_health 100

scoreboard players set @p[scores={shotgun_ammo=101..}] shotgun_ammo 100