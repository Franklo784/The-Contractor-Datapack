# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.player_arm.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'player_arm', 'function_path': 'animated_java:player_arm/animations/slide/play'}
tag @s add aj.player_arm.animation.slide.playing
scoreboard players set @s aj.slide.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:player_arm/animations/slide/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only