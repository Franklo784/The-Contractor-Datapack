#>> Inventory

item replace entity @a[tag=ingame,scores={equipped_pistol=1}] hotbar.0 with stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame,scores={equipped_machinegun=1}] hotbar.1 with stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame,scores={equipped_shotgun=1}] hotbar.2 with stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b},hide_tooltip={},item_name='""']
#--- Rocket Launcher ---#
#--- Railgun ---#
#--- Minigun ---#

item replace entity @a[tag=ingame,scores={equipped_pistol=0}] hotbar.0 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame,scores={equipped_machinegun=0}] hotbar.1 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame,scores={equipped_shotgun=0}] hotbar.2 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame] hotbar.3 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame] hotbar.4 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame] hotbar.5 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']

item replace entity @a[tag=ingame] hotbar.6 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame] hotbar.7 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @a[tag=ingame] hotbar.8 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']

#> Arm

# Display

execute at @a if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{Arm:1b}}}},tag=ingame] unless entity @e[tag=arm_model] run function animated_java:player_arm/summon {args:1}
execute at @a if entity @a[tag=ingame] unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{Arm:1b}}}}] run function animated_java:player_arm/remove/all
execute unless entity @a[tag=ingame] run function animated_java:player_arm/remove/all

execute as @a[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=arm_model] ^ ^ ^.8 ~ ~
execute as @a[tag=sliding] at @s positioned ~ ~.7 ~ run tp @e[tag=arm_model] ^ ^ ^1.2 ~ ~

execute as @e[tag=arm_model] unless entity @a[tag=sliding] run function animated_java:player_arm/animations/idle/play
execute as @e[tag=arm_model] if entity @a[tag=sliding] run function animated_java:player_arm/animations/slide/play

#>> Main Weapons

#> Interaction

execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{MainWeapon:1b}}}}] unless entity @e[tag=wpn_interaction] run summon interaction ~ ~ ~ {Tags:["wpn_interaction"],height:4,width:4}
execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{MainWeapon:1b}}}}] run kill @e[tag=wpn_interaction]
execute as @a at @s run tp @e[tag=wpn_interaction] ~ ~ ~

#> Energy Piercer (Pistol)

# Display

execute at @a if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{Pistol:1b}}}},tag=ingame] unless entity @e[tag=pistol_model] run function animated_java:pistol/summon {args:1}
execute at @a if entity @a[tag=ingame] unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{Pistol:1b}}}}] run function animated_java:pistol/remove/all
execute unless entity @a[tag=ingame] run function animated_java:pistol/remove/all
execute as @a[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=pistol_model] ^ ^ ^.8 ~ ~
execute as @a[tag=sliding] at @s positioned ~ ~.5 ~ run tp @e[tag=pistol_model] ^ ^ ^1.5 ~ ~

# Ammo

# Main Fire

execute as @e[tag=wpn_interaction] on target if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Pistol:1b}}}}] as @e[tag=pistol_model] unless score .pistol wpn_cooldown matches 1.. run function animated_java:pistol/animations/shoot/play
execute as @e[tag=wpn_interaction] on target if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Pistol:1b}}}}] at @s unless score .pistol wpn_cooldown matches 1.. run playsound weapon.pistol.fire player @s ~ ~ ~ 0.5 2 1
execute as @e[tag=wpn_interaction] on target if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Pistol:1b}}}},tag=!sliding] at @s positioned ~ ~1.5 ~ unless score .pistol wpn_cooldown matches 1.. run function d:weapons/raycast/pistol
execute as @e[tag=wpn_interaction] on target if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Pistol:1b}}}},tag=sliding] at @s positioned ~ ~.8 ~ unless score .pistol wpn_cooldown matches 1.. run function d:weapons/raycast/pistol
execute as @e[tag=wpn_interaction] on target if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Pistol:1b}}}}] unless score .pistol wpn_cooldown matches 1.. run scoreboard players set .pistol wpn_cooldown 10

execute if score .pistol wpn_cooldown matches 1.. run scoreboard players remove .pistol wpn_cooldown 1

#> All

data remove entity @n[tag=wpn_interaction] interaction

#>> Sub Weapon

#> Use

scoreboard players set @p[tag=ingame,nbt={Inventory:[{Slot:-106b}]}] used_sub 1
item replace entity @p[tag=ingame,nbt={Inventory:[{Slot:-106b}]}] weapon.offhand with air

#> None

execute at @a if entity @a[tag=ingame,scores={sub_weapon=0}] unless entity @e[tag=arm_model_left] run function animated_java:left_arm/summon {args:1}
execute at @a if entity @a[tag=ingame] unless entity @a[scores={sub_weapon=0}] run function animated_java:left_arm/remove/all
execute unless entity @a[tag=ingame] run function animated_java:left_arm/remove/all

execute as @a[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=arm_model_left] ^ ^ ^.8 ~ ~
execute as @a[tag=sliding] at @s positioned ~ ~.7 ~ run tp @e[tag=arm_model_left] ^ ^ ^1.2 ~ ~

execute as @e[tag=arm_model_left] unless entity @a[tag=sliding] run function animated_java:left_arm/animations/idle/play
execute as @e[tag=arm_model_left] if entity @a[tag=sliding] run function animated_java:left_arm/animations/slide/play

# Display

#> Hellsteel Blade

# Display

execute at @a if entity @a[tag=ingame,scores={sub_weapon=1}] unless entity @e[tag=sword_model] run function animated_java:subweapon_sword/summon {args:1}
execute at @a if entity @a[tag=ingame] unless entity @a[scores={sub_weapon=1}] run function animated_java:subweapon_sword/remove/all
execute unless entity @a[tag=ingame] run function animated_java:subweapon_sword/remove/all

execute as @a[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=sword_model] ^ ^ ^.8 ~ ~
execute as @a[tag=sliding] at @s positioned ~ ~.5 ~ run tp @e[tag=sword_model] ^ ^ ^1.2 ~ ~

# Attacking

execute if entity @a[tag=ingame,scores={used_sub=1,sub_weapon=1,sword_cooldown=0}] as @e[tag=sword_model] run function animated_java:subweapon_sword/animations/slash/play
scoreboard players set @a[tag=ingame,scores={used_sub=1,sub_weapon=1,sword_cooldown=0}] sword_cooldown 10

#> All

# Reset

scoreboard players reset @a[scores={used_sub=1..}] used_sub