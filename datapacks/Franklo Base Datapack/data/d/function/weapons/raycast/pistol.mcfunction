particle dust{color:[0,1,1],scale:1} ~ ~ ~ 0.1 0.1 0.1 0 5 force
particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0 5 force

execute positioned ^ ^ ^0.3 if block ~ ~ ~ #translucent if entity @s[distance=..15] run function d:weapons/raycast/pistol