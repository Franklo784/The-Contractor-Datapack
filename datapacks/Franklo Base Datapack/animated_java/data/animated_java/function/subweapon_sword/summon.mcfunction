# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
data modify storage aj:temp args set value {variant:'', animation:'', frame: 0}
$execute store success score #success aj.i run data modify storage aj:temp args set value $(args)
summon minecraft:item_display ~ ~ ~ { Tags:['aj.new','aj.global.entity','aj.global.root','aj.subweapon_sword.root'], teleport_duration: 0, interpolation_duration: 1, Passengers:[{id:"minecraft:marker",Tags:["aj.global.node","aj.global.data","aj.subweapon_sword.data"],data:{rigHash:"aed156fe4ae82b7f39338af2bfac76a6672ca0848c4ce785a95d61a0eaba1b82",locators:{},cameras:{},bones:{data_data:"",bone_arm:"",bone_sword:""}}},{Tags:["aj.global.bone","aj.global.bone.arm.tree","aj.global.bone.arm.tree.bone","aj.global.bone.bone.child","aj.global.bone.bone.child.bone","aj.global.bone.bone.decendant","aj.global.bone.bone.decendant.bone","aj.global.bone.bone.tree","aj.global.bone.bone.tree.bone","aj.global.display_node.arm","aj.global.entity","aj.global.node","aj.global.node.arm","aj.subweapon_sword.bone","aj.subweapon_sword.bone.arm","aj.subweapon_sword.bone.arm.tree","aj.subweapon_sword.bone.arm.tree.bone","aj.subweapon_sword.bone.bone.child","aj.subweapon_sword.bone.bone.child.bone","aj.subweapon_sword.bone.bone.decendant","aj.subweapon_sword.bone.bone.decendant.bone","aj.subweapon_sword.bone.bone.tree","aj.subweapon_sword.bone.bone.tree.bone","aj.subweapon_sword.display_node.arm","aj.subweapon_sword.entity","aj.subweapon_sword.node","aj.subweapon_sword.node.arm"],id:"minecraft:item_display",transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f]},interpolation_duration:1,teleport_duration:0,item_display:"head",item:{id:"minecraft:white_dye",Count:1,components:{"minecraft:item_model":"animated_java:blueprint/subweapon_sword/arm","minecraft:custom_model_data":{strings:["default"]}}},height:48f,width:48f},{Tags:["aj.global.bone","aj.global.bone.bone.child","aj.global.bone.bone.child.bone","aj.global.bone.bone.decendant","aj.global.bone.bone.decendant.bone","aj.global.bone.bone.tree","aj.global.bone.bone.tree.bone","aj.global.bone.sword.tree","aj.global.bone.sword.tree.bone","aj.global.display_node.sword","aj.global.entity","aj.global.node","aj.global.node.sword","aj.subweapon_sword.bone","aj.subweapon_sword.bone.bone.child","aj.subweapon_sword.bone.bone.child.bone","aj.subweapon_sword.bone.bone.decendant","aj.subweapon_sword.bone.bone.decendant.bone","aj.subweapon_sword.bone.bone.tree","aj.subweapon_sword.bone.bone.tree.bone","aj.subweapon_sword.bone.sword","aj.subweapon_sword.bone.sword.tree","aj.subweapon_sword.bone.sword.tree.bone","aj.subweapon_sword.display_node.sword","aj.subweapon_sword.entity","aj.subweapon_sword.node","aj.subweapon_sword.node.sword"],id:"minecraft:item_display",transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f]},interpolation_duration:1,teleport_duration:0,item_display:"head",item:{id:"minecraft:white_dye",Count:1,components:{"minecraft:item_model":"animated_java:blueprint/subweapon_sword/sword","minecraft:custom_model_data":{strings:["default"]}}},height:48f,width:48f}], }
execute as @e[type=item_display,tag=aj.new,limit=1,distance=..0.01] run function animated_java:subweapon_sword/zzz/0