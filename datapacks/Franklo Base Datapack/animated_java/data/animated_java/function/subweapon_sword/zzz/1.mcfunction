# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
function animated_java:global/internal/gu/convert_uuid_array_to_string with entity @s
data modify entity @s data.bones.data_data set from storage aj:uuid main.out
execute on vehicle on passengers if entity @s[tag=aj.subweapon_sword.node.arm] run function animated_java:global/internal/gu/convert_uuid_array_to_string with entity @s
data modify entity @s data.bones.bone_arm set from storage aj:uuid main.out
execute on vehicle on passengers if entity @s[tag=aj.subweapon_sword.node.sword] run function animated_java:global/internal/gu/convert_uuid_array_to_string with entity @s
data modify entity @s data.bones.bone_sword set from storage aj:uuid main.out