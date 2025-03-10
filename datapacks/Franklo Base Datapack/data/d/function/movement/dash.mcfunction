execute if entity @s[nbt={OnGround:0b}] run scoreboard players set $strength player_motion.api.launch 7500
execute if entity @s[nbt={OnGround:1b}] run scoreboard players set $strength player_motion.api.launch 30000
function player_motion:api/launch_looking
scoreboard players set @s dash_cooldown 5
scoreboard players remove @s stamina 45
scoreboard players set @s player_invul 6
scoreboard players set @s dash_time 10
playsound custom.dash player @s ~ ~ ~ 0.5 1 1