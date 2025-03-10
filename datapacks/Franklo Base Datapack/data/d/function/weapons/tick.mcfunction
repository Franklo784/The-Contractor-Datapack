#>> Inventory

scoreboard players set @p[scores={unlocked_weapons=0,equipped_pistol=1}] equipped_pistol 0
scoreboard players set @p[scores={unlocked_weapons=..1,equipped_machinegun=1}] equipped_machinegun 0
scoreboard players set @p[scores={unlocked_weapons=..2,equipped_shotgun=1}] equipped_shotgun 0

scoreboard players set @p[scores={unlocked_subs=0,sub.equipped_blade=1}] sub.equipped_blade 0
scoreboard players set @p[scores={unlocked_subs=..1,sub.equipped_dash=1}] sub.equipped_dash 0
scoreboard players set @p[scores={unlocked_subs=..3,sub.equipped_grapple=1}] sub.equipped_grapple 0

execute if score @p sub.equipped_blade matches 0 run scoreboard players set @p[scores={sub_weapon=1}] sub_weapon 0
execute if score @p sub.equipped_blade matches 0 if score @p sub.equipped_dash matches 0 run scoreboard players set @p[scores={sub_weapon=2}] sub_weapon 0
execute if score @p sub.equipped_dash matches 0 if score @p sub.equipped_grapple matches 0 run scoreboard players set @p[scores={sub_weapon=3}] sub_weapon 0

item replace entity @p[tag=ingame,scores={equipped_pistol=1}] hotbar.0 with stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame,scores={equipped_machinegun=1}] hotbar.1 with stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame,scores={equipped_shotgun=1}] hotbar.2 with stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b},hide_tooltip={},item_name='""']
#--- Rocket Launcher ---#
#--- Railgun ---#
#--- Minigun ---#

item replace entity @p[tag=ingame,scores={equipped_pistol=0}] hotbar.0 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame,scores={equipped_machinegun=0}] hotbar.1 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame,scores={equipped_shotgun=0}] hotbar.2 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame] hotbar.3 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame] hotbar.4 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame] hotbar.5 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']

item replace entity @p[tag=ingame] hotbar.6 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame] hotbar.7 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']
item replace entity @p[tag=ingame] hotbar.8 with stick[custom_data={Weapons:1b,Arm:1b},hide_tooltip={},item_name='""']

#> Gain New Weapons

execute as @e[tag=shotgun_pickup_display] at @s if entity @p[distance=..2.25] run function d:weapons/unlock/shotgun

#> Arm

# Display

execute at @p if entity @p[tag=ingame,tag=!dead] if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,Arm:1b}] unless entity @e[tag=arm_model] run function animated_java:player_arm/summon {args:1}
execute at @p if entity @p[tag=ingame,tag=!dead] unless items entity @p weapon.mainhand stick[custom_data={Weapons:1b,Arm:1b}] run function animated_java:player_arm/remove/all
execute unless entity @p[tag=ingame] run function animated_java:player_arm/remove/all
execute if entity @p[tag=dead] run function animated_java:player_arm/remove/all

execute as @p[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=arm_model] ^ ^ ^.8 ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.7 ~ run tp @e[tag=arm_model] ^ ^ ^1.5 ~ ~

execute as @e[tag=arm_model] unless entity @p[tag=sliding] run function animated_java:player_arm/animations/idle/play
execute as @e[tag=arm_model] if entity @p[tag=sliding] run function animated_java:player_arm/animations/slide/play

#>> Main Weapons

#> Interaction

execute if entity @p[nbt={SelectedItem:{components:{"minecraft:custom_data":{MainWeapon:1b}}}},tag=!dead] unless entity @e[tag=wpn_interaction] run summon interaction ~ ~ ~ {Tags:["wpn_interaction"],height:4,width:4}
execute unless entity @p[nbt={SelectedItem:{components:{"minecraft:custom_data":{MainWeapon:1b}}}},tag=!dead] run kill @e[tag=wpn_interaction]
execute if entity @p[tag=dead] run kill @e[tag=wpn_interaction]
execute as @p at @s run tp @e[tag=wpn_interaction] ^ ^ ^2.5

#> Energy Piercer (Pistol)

# Display

execute at @p if entity @p[tag=ingame,tag=!dead] if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] unless entity @e[tag=pistol_model] run function animated_java:pistol/summon {args:1}
execute at @p if entity @p[tag=ingame,tag=!dead] unless items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] run function animated_java:pistol/remove/all
execute unless entity @p[tag=ingame] run function animated_java:pistol/remove/all
execute if entity @p[tag=dead] run function animated_java:pistol/remove/all
execute as @p[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=pistol_model] ^ ^ ^.9 ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.5 ~ run tp @e[tag=pistol_model] ^ ^ ^1.5 ~ ~

execute if score @p coin_count matches 4 as @e[tag=pistol_model] run function animated_java:pistol/variants/default/apply
execute if score @p coin_count matches 3 if score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/full_half/apply
execute if score @p coin_count matches 3 unless score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/third/apply
execute if score @p coin_count matches 2 if score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/third_half/apply
execute if score @p coin_count matches 2 unless score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/half/apply
execute if score @p coin_count matches 1 if score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/half_half/apply
execute if score @p coin_count matches 1 unless score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/one/apply
execute if score @p coin_count matches 0 if score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/one_half/apply
execute if score @p coin_count matches 0 unless score @p coin_refill matches 40.. as @e[tag=pistol_model] run function animated_java:pistol/variants/empty/apply

# Main Fire

execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] as @e[tag=pistol_model] unless score .pistol wpn_cooldown matches 1.. run function animated_java:pistol/animations/shoot/play
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] at @s unless score .pistol wpn_cooldown matches 1.. run playsound weapon.pistol.fire player @s ~ ~ ~ 0.5 2 1
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] if entity @s[tag=!sliding] at @s positioned ~ ~1.5 ~ unless score .pistol wpn_cooldown matches 1.. run function d:weapons/raycast/pistol
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] if entity @s[tag=sliding] at @s positioned ~ ~.8 ~ unless score .pistol wpn_cooldown matches 1.. run function d:weapons/raycast/pistol
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] unless score .pistol wpn_cooldown matches 1.. run scoreboard players set .pistol wpn_cooldown 10

execute if score .pistol wpn_pierce matches 1.. run scoreboard players reset .pistol wpn_pierce
execute if score .pistol wpn_cooldown matches 1.. run scoreboard players remove .pistol wpn_cooldown 1

# Alt Fire

execute at @p if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] if score @p coin_refill matches 79 run playsound weapon.pistol.coin.refill player @p ~ ~ ~ 1 1.5 1

execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] at @s unless score .pistol_alt wpn_cooldown matches 1.. if score @s coin_count matches 1.. run playsound weapon.pistol.coin.throw player @p ~ ~ ~ .75 0.8 1
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] if entity @s[tag=!sliding] at @p unless score .pistol_alt wpn_cooldown matches 1.. if score @s coin_count matches 1.. run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","coin"]}
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] if entity @s[tag=sliding] at @p unless score .pistol_alt wpn_cooldown matches 1.. if score @s coin_count matches 1.. run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","coin"]}
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] unless score .pistol_alt wpn_cooldown matches 1.. if score @s coin_count matches 1.. run scoreboard players remove @p coin_count 1
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Pistol:1b}] unless score .pistol_alt wpn_cooldown matches 1.. if score @s coin_count matches 1.. run scoreboard players set .pistol_alt wpn_cooldown 3

execute if score .pistol_alt wpn_cooldown matches 1.. run scoreboard players remove .pistol_alt wpn_cooldown 1

# - Coins

execute as @p[tag=!sliding] at @s run tp @e[tag=coin,scores={projectile_lifetime=1..2}] ~ ~1.5 ~ ~ ~
execute as @p[tag=sliding] at @s run tp @e[tag=coin,scores={projectile_lifetime=1..2}] ~ ~.8 ~ ~ ~

execute as @e[tag=coin] at @s unless entity @e[tag=coin_display,distance=..1,limit=1,sort=nearest] run summon item_display ~ ~ ~ {Tags:["coin_display"],item:{id:"minecraft:stick",count:1,components:{"minecraft:custom_model_data":{floats:[7]}}},Glowing:1b,glow_color_override:65535}
execute as @e[tag=coin_display] at @s unless entity @e[tag=coin,distance=..1,limit=1,sort=nearest] run kill @s

execute as @e[tag=coin] at @s run tp @e[tag=coin_display,distance=..1,limit=1,sort=nearest] ~ ~ ~ ~ ~

execute as @e[tag=coin,scores={projectile_lifetime=1..6},tag=!coin_shot] at @s run tp @s ^ ^ ^.15 ~ ~-4
execute as @e[tag=coin,scores={projectile_lifetime=7..13},tag=!coin_shot] at @s run tp @s ^ ^ ^.225 ~ ~-2.5
execute as @e[tag=coin,scores={projectile_lifetime=14..16},tag=!coin_shot] at @s run tp @s ^ ^ ^.125 ~ ~3.5
execute as @e[tag=coin,scores={projectile_lifetime=17..},tag=!coin_shot] at @s run tp @s ^ ^ ^.175 ~ ~7

execute as @e[tag=coin] at @s unless block ~ ~ ~ #translucent run kill @s
kill @e[tag=coin,scores={projectile_lifetime=400..},tag=!coin_shot]

#> SG MKII (Machinegun/Rifle)

# Display

execute at @p if entity @p[tag=ingame,tag=!dead] if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] unless entity @e[tag=machinegun_model] run function animated_java:machinegun/summon {args:1}
execute at @p if entity @p[tag=ingame,tag=!dead] unless items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] run function animated_java:machinegun/remove/all
execute unless entity @p[tag=ingame,tag=!dead] run function animated_java:machinegun/remove/all
execute if entity @p[tag=dead] run function animated_java:machinegun/remove/all
execute as @p[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=machinegun_model] ^ ^ ^.9 ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.5 ~ run tp @e[tag=machinegun_model] ^ ^ ^1.5 ~ ~

execute as @e[tag=machinegun_model,tag=model_init] run function animated_java:machinegun/animations/idle/play
tag @e[tag=machinegun_model,tag=model_init] remove model_init

# Main Fire

execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] as @e[tag=machinegun_model] unless score .machinegun wpn_cooldown matches 1.. unless score .machinegun_alt wpn_cooldown matches 1.. run function animated_java:machinegun/animations/shoot/play
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] at @s unless score .machinegun wpn_cooldown matches 1.. unless score .machinegun_alt wpn_cooldown matches 1.. run playsound weapon.machinegun.ready player @s ~ ~ ~ .85 1 1
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] unless score .machinegun wpn_cooldown matches 1.. unless score .machinegun_alt wpn_cooldown matches 1.. run scoreboard players set .machinegun wpn_cooldown 54

execute if score .machinegun wpn_cooldown matches 1.. run scoreboard players remove .machinegun wpn_cooldown 1
execute if score .machinegun wpn_cooldown matches 1.. unless items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] run scoreboard players set .machinegun wpn_cooldown 3

execute as @p at @s if score .machinegun wpn_cooldown matches 30 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 30 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 30 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 28 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 28 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 28 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 26 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 26 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 26 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 24 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 24 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 24 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 22 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 22 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 22 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 20 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 20 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 20 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 18 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 18 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 18 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 16 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 16 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 16 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 14 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 14 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 14 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 12 run playsound weapon.machinegun.fire player @s ~ ~ ~ .5 2 1
execute at @p[tag=!sliding] if score .machinegun wpn_cooldown matches 12 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}
execute at @p[tag=sliding] if score .machinegun wpn_cooldown matches 12 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_bullet"]}

execute as @p at @s if score .machinegun wpn_cooldown matches 10 run playsound weapon.machinegun.reload player @s ~ ~ ~ .5 0 1

# Bullets

execute as @p[tag=!sliding] at @s run tp @e[tag=machinegun_bullet,scores={projectile_lifetime=1..2}] ~ ~1.5 ~ ~ ~
execute as @p[tag=sliding] at @s run tp @e[tag=machinegun_bullet,scores={projectile_lifetime=1..2}] ~ ~.8 ~ ~ ~
execute as @e[tag=machinegun_bullet] at @s run tp @s ^ ^ ^.85
execute at @e[tag=machinegun_bullet] run particle soul_fire_flame ~ ~ ~ .1 .1 .1 0 1

execute as @e[tag=machinegun_bullet,scores={projectile_lifetime=1..2}] at @s unless entity @e[tag=machinegun_bullet_display,distance=..1,limit=1,sort=nearest] run summon item_display ~ ~ ~ {Tags:["machinegun_bullet_display"],item:{id:"minecraft:stick",count:1,components:{"minecraft:custom_model_data":{floats:[5]}}},Glowing:1b,glow_color_override:65535}
execute as @e[tag=machinegun_bullet_display] at @s unless entity @e[tag=machinegun_bullet,distance=..1,limit=1,sort=nearest] run kill @s

execute as @e[tag=machinegun_bullet] at @s run tp @e[tag=machinegun_bullet_display,distance=..1,limit=1,sort=nearest] ~ ~ ~ ~ ~

execute as @e[tag=machinegun_bullet] at @s as @e[tag=enemy,dx=0,scores={machinegun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run function d:weapons/damage {damage:"60",dmg_type:"2"}
execute as @e[tag=machinegun_bullet] at @s as @e[tag=enemy,dx=0,scores={machinegun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run damage @s 0.01
execute as @e[tag=machinegun_bullet] at @s as @e[tag=enemy,dx=0,scores={machinegun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run function d:style/add_hidden_style {style_amount:5}
execute as @e[tag=machinegun_bullet] at @s as @e[tag=enemy,dx=0,scores={machinegun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players set @s machinegun_invul 5
execute as @e[tag=machinegun_bullet] at @s as @e[tag=enemy,dx=0,scores={machinegun_invul=1..}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run kill @n[tag=machinegun_bullet]

execute as @e[tag=machinegun_bullet] at @s unless block ~ ~ ~ #translucent run kill @s
kill @e[tag=machinegun_bullet,scores={projectile_lifetime=20..}]

# Alt Fire

execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] as @e[tag=machinegun_model] unless score .machinegun_alt wpn_cooldown matches 1.. unless score .machinegun wpn_cooldown matches 1.. run function animated_java:machinegun/animations/alt_fire/play
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] at @s unless score .machinegun_alt wpn_cooldown matches 1.. unless score .machinegun wpn_cooldown matches 1.. run playsound weapon.machinegun.ready player @s ~ ~ ~ .85 2 1
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] unless score .machinegun_alt wpn_cooldown matches 1.. unless score .machinegun wpn_cooldown matches 1.. run scoreboard players set .machinegun_alt wpn_cooldown 40

execute as @p at @s if score .machinegun_alt wpn_cooldown matches 26 run playsound weapon.machinegun.reload player @s ~ ~ ~ .35 0 1
execute at @p[tag=!sliding] if score .machinegun_alt wpn_cooldown matches 26 run summon marker ~ ~1.5 ~ {Tags:["projectile","player_projectile","machinegun_grenade"]}
execute at @p[tag=sliding] if score .machinegun_alt wpn_cooldown matches 26 run summon marker ~ ~.8 ~ {Tags:["projectile","player_projectile","machinegun_grenade"]}

execute if score .machinegun_alt wpn_cooldown matches 1.. run scoreboard players remove .machinegun_alt wpn_cooldown 1
execute if score .machinegun_alt wpn_cooldown matches 1.. unless items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Machinegun:1b}] run scoreboard players reset .machinegun_alt wpn_cooldown

# Ammo Grenade

execute as @p[tag=!sliding] at @s run tp @e[tag=machinegun_grenade,scores={projectile_lifetime=1..2}] ~ ~1.5 ~ ~ ~
execute as @p[tag=sliding] at @s run tp @e[tag=machinegun_grenade,scores={projectile_lifetime=1..2}] ~ ~.8 ~ ~ ~

execute as @p[tag=sliding] run tag @e[tag=machinegun_grenade,scores={projectile_lifetime=1..2}] add machinegun_grenade_sliding

execute as @e[tag=machinegun_grenade] at @s unless entity @e[tag=machinegun_grenade_display,distance=..1,limit=1,sort=nearest] run summon item_display ~ ~ ~ {Tags:["machinegun_grenade_display"],item:{id:"minecraft:stick",count:1,components:{"minecraft:custom_model_data":{floats:[4]}}},Glowing:1b,glow_color_override:65535}
execute as @e[tag=machinegun_grenade_display] at @s unless entity @e[tag=machinegun_grenade,distance=..1,limit=1,sort=nearest] run kill @s

execute as @e[tag=machinegun_grenade] at @s run tp @e[tag=machinegun_grenade_display,distance=..1,limit=1,sort=nearest] ~ ~ ~ ~ ~

execute at @e[tag=machinegun_grenade,scores={projectile_lifetime=3..}] run particle soul_fire_flame ~ ~ ~ .1 .1 .1 0 3

execute as @e[tag=machinegun_grenade,scores={projectile_lifetime=1..8},tag=!machinegun_grenade_sliding] at @s run tp @s ^ ^ ^.5 ~ ~-3
execute as @e[tag=machinegun_grenade,scores={projectile_lifetime=9..15},tag=!machinegun_grenade_sliding] at @s run tp @s ^ ^ ^.225 ~ ~1.25
execute as @e[tag=machinegun_grenade,scores={projectile_lifetime=16..},tag=!machinegun_grenade_sliding] at @s run tp @s ^ ^ ^.5 ~ ~5

execute as @e[tag=machinegun_grenade,scores={projectile_lifetime=1..8},tag=machinegun_grenade_sliding] at @s run tp @s ^ ^ ^1 ~ ~-4.5
execute as @e[tag=machinegun_grenade,scores={projectile_lifetime=9..15},tag=machinegun_grenade_sliding] at @s run tp @s ^ ^ ^.45 ~ ~1.875
execute as @e[tag=machinegun_grenade,scores={projectile_lifetime=16..},tag=machinegun_grenade_sliding] at @s run tp @s ^ ^ ^.75 ~ ~7.5

kill @e[tag=machinegun_grenade,scores={projectile_lifetime=400..}]

execute as @e[tag=machinegun_grenade] at @s unless block ~ ~ ~ #translucent run summon marker ~ ~ ~ {Tags:["player_projectile","machinegun_grenade_explode"]}
execute as @e[tag=machinegun_grenade] at @s unless block ~ ~ ~ #translucent run kill @s

execute at @e[tag=machinegun_grenade_explode] run playsound entity.generic.explode player @p ~ ~ ~ .5 2 .75
execute at @e[tag=machinegun_grenade_explode] run function d:particles/radius/machinegun_ammo_explode
execute at @e[tag=machinegun_grenade_explode] run particle explosion_emitter ~ ~.1 ~ .5 .5 .5 0 1

execute at @e[tag=machinegun_grenade_explode] as @e[tag=enemy,distance=1.1..3.5,scores={machinegun_alt_invul=0}] run function d:weapons/damage {damage:"125",dmg_type:"3"}
execute at @e[tag=machinegun_grenade_explode] as @e[tag=enemy,distance=..1,scores={machinegun_alt_invul=0}] run function d:weapons/damage {damage:"250",dmg_type:"3"}
execute at @e[tag=machinegun_grenade_explode] as @e[tag=enemy,distance=..3.5,scores={machinegun_alt_invul=0}] run damage @s 0.01
execute at @e[tag=machinegun_grenade_explode] run scoreboard players set @e[tag=enemy,distance=..3.5,scores={machinegun_alt_invul=0}] machinegun_alt_invul 30

execute at @e[tag=machinegun_grenade_explode] run scoreboard players remove @p[tag=ingame,distance=1.1..3.5,scores={player_invul=0},gamemode=adventure] player_health 35
execute at @e[tag=machinegun_grenade_explode] run scoreboard players remove @p[tag=ingame,distance=..1,scores={player_invul=0},gamemode=adventure] player_health 50
execute at @e[tag=machinegun_grenade_explode] at @p[tag=ingame,distance=..3.5,scores={player_invul=0},gamemode=adventure] run playsound entity.player.hurt player @p
execute at @e[tag=machinegun_grenade_explode] run scoreboard players set @p[tag=ingame,distance=..3.5,scores={player_invul=0},gamemode=adventure] player_invul 30

execute at @e[tag=machinegun_grenade_explode] as @p[tag=ingame,distance=..3.5,gamemode=adventure] at @s run function d:weapons/machinegun_grenade_recoil

kill @e[tag=machinegun_grenade_explode]

#> Heatblaster (Shotgun)

# Display

execute at @p if entity @p[tag=ingame,tag=!dead] if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] unless entity @e[tag=shotgun_model] run function animated_java:shotgun/summon {args:1}
execute at @p if entity @p[tag=ingame,tag=!dead] unless items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] run function animated_java:shotgun/remove/all
execute unless entity @p[tag=ingame,tag=!dead] run function animated_java:shotgun/remove/all
execute if entity @p[tag=dead] run function animated_java:shotgun/remove/all
execute as @p[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=shotgun_model] ^ ^ ^.575 ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.5 ~ run tp @e[tag=shotgun_model] ^ ^ ^1.275 ~ ~

execute if score @p shotgun_ammo matches 100 as @e[tag=shotgun_model] run function animated_java:shotgun/variants/default/apply
execute if score @p shotgun_ammo matches 75..99 as @e[tag=shotgun_model] run function animated_java:shotgun/variants/third/apply
execute if score @p shotgun_ammo matches 50..74 as @e[tag=shotgun_model] run function animated_java:shotgun/variants/half/apply
execute if score @p shotgun_ammo matches 25..49 as @e[tag=shotgun_model] run function animated_java:shotgun/variants/quarter/apply
execute if score @p shotgun_ammo matches 0..24 as @e[tag=shotgun_model] run function animated_java:shotgun/variants/empty/apply

# Main Fire

execute at @p if score @p shotgun_ammo matches 24 unless score @p using_shotgun_alt matches 1.. if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] run playsound weapon.shotgun.recharge player @p ~ ~ ~ .35 2 1
execute at @p if score @p shotgun_ammo matches 49 unless score @p using_shotgun_alt matches 1.. if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] run playsound weapon.shotgun.recharge player @p ~ ~ ~ .35 2 1
execute at @p if score @p shotgun_ammo matches 74 unless score @p using_shotgun_alt matches 1.. if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] run playsound weapon.shotgun.recharge player @p ~ ~ ~ .35 2 1
execute at @p if score @p shotgun_ammo matches 99 unless score @p using_shotgun_alt matches 1.. if items entity @p weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] run playsound weapon.shotgun.recharge player @p ~ ~ ~ .35 2 1

execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s shotgun_ammo matches 25.. as @e[tag=shotgun_model] unless score .shotgun wpn_cooldown matches 1.. unless score @p using_shotgun_alt matches 1.. run function animated_java:shotgun/animations/shoot/play
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] at @s unless score .shotgun wpn_cooldown matches 1.. if score @s shotgun_ammo matches 25.. unless score @s using_shotgun_alt matches 1.. run playsound weapon.shotgun.fire player @s ~ ~ ~ .35 2 1
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if entity @s[tag=!sliding] at @s unless score .shotgun wpn_cooldown matches 1.. if score @s shotgun_ammo matches 25.. unless score @s using_shotgun_alt matches 1.. run function d:weapons/shotgun_bullets {offset:"1.5"}
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if entity @s[tag=sliding] at @s unless score .shotgun wpn_cooldown matches 1.. if score @s shotgun_ammo matches 25.. unless score @s using_shotgun_alt matches 1.. run function d:weapons/shotgun_bullets {offset:"0.8"}
execute as @e[tag=wpn_interaction] on target if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] unless score .shotgun wpn_cooldown matches 1.. if score @s shotgun_ammo matches 25.. unless score @s using_shotgun_alt matches 1.. run function d:weapons/shotgun_cooldown

execute if score .shotgun wpn_cooldown matches 1.. run scoreboard players remove .shotgun wpn_cooldown 1

execute as @p at @s if score .shotgun wpn_cooldown matches 20 run playsound weapon.shotgun.reload player @s ~ ~ ~ .65 1 1

#- Shotgun Shell

execute as @p[tag=!sliding] at @s run tp @e[tag=shotgun_projectile,scores={projectile_lifetime=1..2}] ~ ~1.5 ~ ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.8 ~ run tp @e[tag=shotgun_projectile,scores={projectile_lifetime=1..2}] ^ ^ ^1.5 ~ ~

execute if entity @e[tag=shotgun_projectile] run function d:weapons/shotgun_projectile_display
execute unless entity @e[tag=shotgun_projectile] if entity @e[tag=shotgun_projectile_display] run function d:weapons/shotgun_projectile_display

execute at @e[tag=shotgun_projectile,scores={projectile_lifetime=3..}] run particle soul_fire_flame ~ ~ ~ .1 .1 .1 0 1

execute as @e[tag=sp1] at @s run tp @s ^0.09 ^0.05 ^0.5
execute as @e[tag=sp2] at @s run tp @s ^ ^0.05 ^0.5
execute as @e[tag=sp3] at @s run tp @s ^-0.09 ^0.05 ^0.5
execute as @e[tag=sp4] at @s run tp @s ^0.09 ^0.015 ^0.5
execute as @e[tag=sp5] at @s run tp @s ^ ^0.015 ^0.5
execute as @e[tag=sp6] at @s run tp @s ^-0.09 ^0.015 ^0.5
execute as @e[tag=sp7] at @s run tp @s ^0.09 ^-0.015 ^0.5
execute as @e[tag=sp8] at @s run tp @s ^ ^-0.015 ^0.5
execute as @e[tag=sp9] at @s run tp @s ^-0.09 ^-0.015 ^0.5
execute as @e[tag=sp10] at @s run tp @s ^0.09 ^-0.05 ^0.5
execute as @e[tag=sp11] at @s run tp @s ^ ^-0.05 ^0.5
execute as @e[tag=sp12] at @s run tp @s ^-0.09 ^-0.05 ^0.5

execute as @e[tag=shotgun_projectile] at @s as @e[tag=enemy,dx=0,scores={shotgun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run function d:weapons/damage {damage:"45",dmg_type:"2"}
execute as @e[tag=shotgun_projectile] at @s as @e[tag=enemy,dx=0,scores={shotgun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run damage @s 0.01
execute as @e[tag=shotgun_projectile] at @s as @e[tag=enemy,dx=0,scores={shotgun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run function d:style/add_hidden_style {style_amount:18}
execute as @e[tag=shotgun_projectile] at @s as @e[tag=enemy,dx=0,scores={shotgun_invul=0}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players set @s shotgun_invul 3
execute as @e[tag=shotgun_projectile] at @s as @e[tag=enemy,dx=0,scores={shotgun_invul=1..}] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run kill @n[tag=shotgun_projectile]

execute as @e[tag=shotgun_projectile] at @s unless block ~ ~ ~ #translucent run kill @s
kill @e[tag=shotgun_projectile,scores={projectile_lifetime=15..}]

# Alt Fire

execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] at @p if score @s shotgun_ammo matches 25.. unless score @s using_shotgun_alt matches 1.. unless score .shotgun wpn_cooldown matches 1.. run playsound weapon.shotgun.alt_ready player @s ~ ~ ~ 1 1 1
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s shotgun_ammo matches 25.. unless score @s using_shotgun_alt matches 1.. as @e[tag=shotgun_model] unless score .shotgun wpn_cooldown matches 1.. run function animated_java:shotgun/animations/begin_alt/play
execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s shotgun_ammo matches 25.. unless score .shotgun wpn_cooldown matches 1.. unless score @s using_shotgun_alt matches 1.. run scoreboard players set @s using_shotgun_alt 35

execute as @e[tag=wpn_interaction] on attacker if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s using_shotgun_alt matches 21..25 run scoreboard players set @s using_shotgun_alt 25

execute as @p at @s if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s using_shotgun_alt matches 21..25 if score @s shotgun_ammo matches 25.. run playsound item.firecharge.use player @s ~ ~ ~ .5 1 1

execute as @p[tag=!sliding] at @s if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s using_shotgun_alt matches 24 if score @s shotgun_ammo matches 25.. run summon marker ~ ~1.2 ~ {Tags:["projectile","player_projectile","shotgun_flamethrower"]}
execute as @p[tag=sliding] at @s if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s using_shotgun_alt matches 24 if score @s shotgun_ammo matches 25.. run summon marker ~ ~.5 ~ {Tags:["projectile","player_projectile","shotgun_flamethrower"]}

execute as @p[tag=!sliding] at @s if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s using_shotgun_alt matches 22 if score @s shotgun_ammo matches 25.. run summon marker ~ ~1.2 ~ {Tags:["projectile","player_projectile","shotgun_flamethrower"]}
execute as @p[tag=sliding] at @s if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s using_shotgun_alt matches 22 if score @s shotgun_ammo matches 25.. run summon marker ~ ~.5 ~ {Tags:["projectile","player_projectile","shotgun_flamethrower"]}

execute as @p at @s if items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] if score @s using_shotgun_alt matches 21..25 if score @s shotgun_ammo matches 25.. run scoreboard players remove @s shotgun_ammo 1

execute as @p at @s if score @s using_shotgun_alt matches 20 run playsound weapon.shotgun.alt_close player @s ~ ~ ~ 1 2 1
execute as @e[tag=shotgun_model] if score @p using_shotgun_alt matches 20 run function animated_java:shotgun/animations/end_alt/play

scoreboard players set @p[scores={shotgun_ammo=..24,using_shotgun_alt=22..}] using_shotgun_alt 21
execute as @p[scores={shotgun_ammo=..24,using_shotgun_alt=21}] at @s run playsound block.fire.extinguish player @s ~ ~ ~ .75 0 1
execute if entity @p[scores={shotgun_ammo=..24,using_shotgun_alt=21}] run scoreboard players set .shotgun_alt wpn_cooldown 35
scoreboard players set @p[scores={shotgun_ammo=..24,using_shotgun_alt=21}] shotgun_ammo 0
execute if score @p using_shotgun_alt matches 0 run scoreboard players set @p[scores={shotgun_ammo=24}] shotgun_ammo 25
execute if score @p using_shotgun_alt matches 0 run scoreboard players set @p[scores={shotgun_ammo=49}] shotgun_ammo 50
execute if score @p using_shotgun_alt matches 0 run scoreboard players set @p[scores={shotgun_ammo=74}] shotgun_ammo 75
execute if score @p using_shotgun_alt matches 0 run scoreboard players set @p[scores={shotgun_ammo=99}] shotgun_ammo 100

execute if score @p using_shotgun_alt matches 1.. run scoreboard players remove @p using_shotgun_alt 1
execute if score .shotgun_alt wpn_cooldown matches 1.. run scoreboard players remove .shotgun_alt wpn_cooldown 1
execute if score .shotgun_alt wpn_cooldown matches 1.. unless items entity @s weapon.mainhand stick[custom_data={Weapons:1b,MainWeapon:1b,Shotgun:1b}] run scoreboard players reset .shotgun_alt wpn_cooldown

#- Flamethrower

execute as @p[tag=!sliding] at @s run tp @e[tag=shotgun_flamethrower,scores={projectile_lifetime=1..2}] ~ ~1.2 ~ ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.5 ~ run tp @e[tag=shotgun_flamethrower,scores={projectile_lifetime=1..2}] ^ ^ ^1.5 ~ ~

execute at @e[tag=shotgun_flamethrower,scores={projectile_lifetime=3..}] run particle soul_fire_flame ~ ~ ~ .35 .35 .35 0 10

execute as @e[tag=shotgun_flamethrower] at @s run tp @s ^ ^ ^0.8

execute as @e[tag=shotgun_flamethrower] at @s as @e[tag=enemy,scores={shotgun_alt_invul=0},distance=..3] run function d:weapons/damage {damage:"25",dmg_type:"4"}
execute as @e[tag=shotgun_flamethrower] at @s as @e[tag=enemy,scores={shotgun_alt_invul=0},distance=..3] run damage @s 0.01
execute as @e[tag=shotgun_flamethrower] at @s as @e[tag=enemy,scores={shotgun_alt_invul=0},distance=..3] run scoreboard players set @s shotgun_alt_invul 10

execute as @e[tag=shotgun_flamethrower] at @s unless block ~ ~ ~ #translucent run kill @s
kill @e[tag=shotgun_flamethrower,scores={projectile_lifetime=8..}]

#> All

data remove entity @n[tag=wpn_interaction] attack
data remove entity @n[tag=wpn_interaction] interaction

#>> Sub Weapon

#> Use

scoreboard players set @p[tag=ingame,nbt={Inventory:[{Slot:-106b}]},tag=!dead] used_sub 1
item replace entity @p[tag=ingame,nbt={Inventory:[{Slot:-106b}]},tag=!dead] weapon.offhand with air

#> None

execute at @p if entity @p[tag=ingame,scores={sub_weapon=0},tag=!dead] unless entity @e[tag=arm_model_left] run function animated_java:left_arm/summon {args:1}
execute at @p if entity @p[tag=ingame,tag=!dead] unless entity @p[scores={sub_weapon=0}] run function animated_java:left_arm/remove/all
execute unless entity @p[tag=ingame] run function animated_java:left_arm/remove/all
execute if entity @p[tag=dead] run function animated_java:left_arm/remove/all

execute as @p[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=arm_model_left] ^ ^ ^.8 ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.7 ~ run tp @e[tag=arm_model_left] ^ ^ ^1.5 ~ ~

execute as @e[tag=arm_model_left] unless entity @p[tag=sliding] run function animated_java:left_arm/animations/idle/play
execute as @e[tag=arm_model_left] if entity @p[tag=sliding] run function animated_java:left_arm/animations/slide/play

# Display

#> Hellsteel Blade

# Display

execute at @p if entity @p[tag=ingame,scores={sub_weapon=1},tag=!dead] unless entity @e[tag=sword_model] run function animated_java:subweapon_sword/summon {args:1}
execute at @p if entity @p[tag=ingame] unless entity @p[scores={sub_weapon=1},tag=!dead] run function animated_java:subweapon_sword/remove/all
execute unless entity @p[tag=ingame] run function animated_java:subweapon_sword/remove/all
execute if entity @p[tag=dead] run function animated_java:subweapon_sword/remove/all

execute as @p[tag=!sliding] at @s positioned ~ ~1.2 ~ run tp @e[tag=sword_model] ^ ^ ^.95 ~ ~
execute as @p[tag=sliding] at @s positioned ~ ~.5 ~ run tp @e[tag=sword_model] ^ ^ ^1.4 ~ ~

# Attacking

execute if entity @p[tag=ingame,scores={used_sub=1,sub_weapon=1,sword_cooldown=0}] as @e[tag=sword_model] run function animated_java:subweapon_sword/animations/slash/play
scoreboard players set @p[tag=ingame,scores={used_sub=1,sub_weapon=1,sword_cooldown=0}] sword_cooldown 10

execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=!sliding] at @s positioned ~ ~1.2 ~ run particle sweep_attack ^ ^ ^2.25 .3 .1 .3 0 35 force
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=sliding] at @s positioned ~ ~.6 ~ run particle sweep_attack ^ ^ ^4 .3 .1 .3 0 35 force

execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=!sliding] at @s positioned ~ ~1.2 ~ positioned ^ ^ ^1.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0}] run damage @s 0.01
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=!sliding] at @s positioned ~ ~1.2 ~ positioned ^ ^ ^1.5 if entity @e[tag=enemy,distance=..2.3,scores={sword_invul=0},tag=!parryable] run function d:weapons/sword_heal
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=!sliding] at @s positioned ~ ~1.2 ~ positioned ^ ^ ^1.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0},tag=!parryable] run function d:weapons/damage {damage:"100",dmg_type:"5"}
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=!sliding] at @s positioned ~ ~1.2 ~ positioned ^ ^ ^1.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0},tag=parryable] at @s run function d:weapons/parried_enemy
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=!sliding] at @s positioned ~ ~1.2 ~ positioned ^ ^ ^1.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0}] run scoreboard players set @s sword_invul 10

execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=sliding] at @s positioned ~ ~.6 ~ positioned ^ ^ ^2.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0}] run damage @s 0.01
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=sliding] at @s positioned ~ ~.6 ~ positioned ^ ^ ^2.5 if entity @e[tag=enemy,distance=..2.3,scores={sword_invul=0},tag=!parryable] run function d:weapons/sword_heal
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=sliding] at @s positioned ~ ~.6 ~ positioned ^ ^ ^2.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0},tag=!parryable,limit=1,sort=nearest] run function d:weapons/damage {damage:"100",dmg_type:"5"}
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=sliding] at @s positioned ~ ~.6 ~ positioned ^ ^ ^2.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0},tag=parryable,tag=!parryable,limit=1,sort=nearest] at @s run function d:weapons/parried_enemy
execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=sliding] at @s positioned ~ ~.6 ~ positioned ^ ^ ^2.5 as @e[tag=enemy,distance=..2.3,scores={sword_invul=0}] run scoreboard players set @s sword_invul 10

# Parrying

execute as @p[scores={sword_cooldown=10,sub_weapon=1},tag=!sliding] at @s positioned ~ ~1.2 ~ run function d:weapons/raycast/parry

# - Projectile

execute as @e[tag=parried] at @s unless block ~ ~ ~ #translucent run summon marker ~ ~ ~ {Tags:["player_projectile","parry_explode"]}
execute as @e[tag=parried] at @s unless block ~ ~ ~ #translucent run kill @s

execute as @e[tag=parried,tag=!enemy_shotgun] at @s as @e[tag=enemy,dx=0,scores={parry_invul=0},limit=3,sort=nearest] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run function d:weapons/damage {damage:"500",dmg_type:"0"}
execute as @e[tag=parried] at @s as @e[tag=enemy,dx=0,scores={parry_invul=0},limit=3,sort=nearest] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run damage @s 0.01
execute as @e[tag=parried,tag=!enemy_shotgun] at @s as @e[tag=enemy,dx=0,scores={parry_invul=0},limit=3,sort=nearest] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players set @s parry_invul 20
execute as @e[tag=parried,tag=!enemy_shotgun] at @s as @e[tag=enemy,dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] at @n[tag=parried,tag=!enemy_shotgun] run summon marker ~ ~ ~ {Tags:["player_projectile","parry_explode"]}

execute as @e[tag=parried,tag=enemy_shotgun] at @s as @e[tag=enemy,dx=0,scores={parry_invul=0},limit=3,sort=nearest] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run function d:weapons/damage {damage:"40",dmg_type:"0"}
execute as @e[tag=parried,tag=enemy_shotgun] at @s as @e[tag=enemy,dx=0,scores={parry_invul=0},limit=3,sort=nearest] at @s positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] run scoreboard players set @s parry_invul 2
execute as @e[tag=parried,tag=enemy_shotgun] at @s as @e[tag=enemy,dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] at @n[tag=parried,tag=enemy_shotgun] run summon marker ~ ~ ~ {Tags:["player_projectile","parry_explode","parry_shotgun_explode"]}

execute as @e[tag=parried] at @s as @e[tag=enemy,dx=0] positioned ~-.99 ~-.99 ~-.99 if entity @s[dx=0] at @s run kill @n[tag=parried]

execute at @e[tag=parry_explode] run playsound entity.generic.explode player @p ~ ~ ~ .5 2 .75
execute at @e[tag=parry_explode] run function d:particles/radius/parry_exlode

execute at @e[tag=parry_explode,tag=!parry_shotgun_explode] as @e[tag=enemy,distance=1.1..2,scores={parry_invul=0}] run function d:weapons/damage {damage:"250",dmg_type:"3"}
execute at @e[tag=parry_explode,tag=!parry_shotgun_explode] as @e[tag=enemy,distance=..1,scores={parry_invul=0}] run function d:weapons/damage {damage:"500",dmg_type:"3"}

execute at @e[tag=parry_explode,tag=parry_shotgun_explode] as @e[tag=enemy,distance=1.1..2,scores={parry_invul=0}] run function d:weapons/damage {damage:"20",dmg_type:"3"}
execute at @e[tag=parry_explode,tag=parry_shotgun_explode] as @e[tag=enemy,distance=..1,scores={parry_invul=0}] run function d:weapons/damage {damage:"45",dmg_type:"3"}

execute at @e[tag=parry_explode] as @e[tag=enemy,distance=..2,scores={parry_invul=0}] run damage @s 0.01
execute at @e[tag=parry_explode] run scoreboard players set @e[tag=enemy,distance=..2,scores={parry_invul=0}] parry_invul 30

execute at @e[tag=parry_explode] run scoreboard players remove @p[tag=ingame,distance=1.1..3,scores={player_invul=0},gamemode=adventure] player_health 35
execute at @e[tag=parry_explode] run scoreboard players remove @p[tag=ingame,distance=..1,scores={player_invul=0},gamemode=adventure] player_health 50
execute at @e[tag=parry_explode] at @p[tag=ingame,distance=..2,scores={player_invul=0},gamemode=adventure] run playsound entity.player.hurt player @p
execute at @e[tag=parry_explode] run scoreboard players set @p[tag=ingame,distance=..2,scores={player_invul=0},gamemode=adventure] player_invul 30

execute at @e[tag=parry_explode] as @p[tag=ingame,distance=..2,gamemode=adventure] at @s run function d:weapons/parry_recoil

kill @e[tag=parry_explode]

execute as @e[tag=parried] at @s run tp @s ^ ^ ^0.85

#-- Display

execute as @e[tag=cursed_soul_projectile,tag=parried] at @s unless entity @e[tag=csp_display_parried,distance=..1,limit=1,sort=nearest] run summon item_display ~ ~ ~ {Tags:["csp_display_parried"],item:{id:"minecraft:stick",count:1,components:{"minecraft:custom_model_data":{floats:[6]}}},Glowing:1b,glow_color_override:65535}
execute as @e[tag=csp_display_parried] at @s unless entity @e[tag=cursed_soul_projectile,distance=..1,limit=1,sort=nearest,tag=parried] run kill @s
execute as @e[tag=cursed_soul_projectile,tag=parried] at @s run tp @e[tag=csp_display_parried,distance=..1,limit=1,sort=nearest] ~ ~ ~ ~ ~

execute as @e[tag=sentry_bullet,tag=parried] at @s unless entity @e[tag=sentry_display_parried,distance=..1,limit=1,sort=nearest] run summon item_display ~ ~ ~ {Tags:["sentry_display_parried"],item:{id:"minecraft:stick",count:1,components:{"minecraft:custom_model_data":{floats:[5]}}},Glowing:1b,glow_color_override:65535}
execute as @e[tag=sentry_display_parried] at @s unless entity @e[tag=sentry_bullet,distance=..1,limit=1,sort=nearest,tag=parried] run kill @s
execute as @e[tag=sentry_bullet,tag=parried] at @s run tp @e[tag=sentry_display_parried,distance=..1,limit=1,sort=nearest] ~ ~ ~ ~ ~

execute if entity @e[tag=exterm_shotgun_projectile,tag=parried] run function d:weapons/exterm_shotgun_display_parried
execute unless entity @e[tag=exterm_shotgun_projectile,tag=parried] if entity @e[tag=exterm_shotgun_projectile_display_parried] run function d:weapons/exterm_shotgun_display_parried

#> All

# Reset

scoreboard players reset @p[scores={used_sub=1..}] used_sub