# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.pistol.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'pistol', 'function_path': 'animated_java:pistol/variants/t3/apply'}
execute on passengers if entity @s[tag=aj.pistol.bone.arm] run function animated_java:pistol/variants/t3/zzz/0
execute on passengers if entity @s[tag=aj.pistol.bone.gun] run function animated_java:pistol/variants/t3/zzz/1