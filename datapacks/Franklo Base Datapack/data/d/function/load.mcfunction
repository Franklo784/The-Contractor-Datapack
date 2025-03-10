#> Scoreboards

scoreboard objectives add hunger food

scoreboard objectives add projectile_lifetime dummy
scoreboard objectives add projectile_unparriable_timer dummy

scoreboard objectives add dash_cooldown dummy
scoreboard objectives add dash_time dummy
scoreboard objectives add stamina dummy
scoreboard objectives add dj_detect custom:aviate_one_cm
scoreboard objectives add dj_time dummy

scoreboard objectives add unlocked_weapons dummy
scoreboard objectives add unlocked_subs dummy
scoreboard objectives add unlocked_alts dummy

scoreboard objectives add equipped_pistol dummy
scoreboard objectives add equipped_machinegun dummy
scoreboard objectives add equipped_shotgun dummy

scoreboard objectives add sub_weapon dummy
scoreboard objectives add used_sub dummy
scoreboard objectives add sword_cooldown dummy
scoreboard objectives add parry_cooldown dummy

scoreboard objectives add sub.equipped_blade dummy
scoreboard objectives add sub.equipped_dash dummy
scoreboard objectives add sub.equipped_dj dummy
scoreboard objectives add sub.equipped_grapple dummy

scoreboard objectives add player_health dummy
scoreboard objectives add player_invul dummy
scoreboard objectives add wpn_cooldown dummy
scoreboard objectives add wpn_pierce dummy
scoreboard objectives add wpn_raycast_range dummy
scoreboard objectives add dmg_taken dummy
scoreboard objectives add dmg_type dummy

scoreboard objectives add style_decay_cooldown dummy
scoreboard objectives add numberical_style dummy
scoreboard objectives add total_style dummy
scoreboard objectives add temporary_style dummy
scoreboard objectives add style_rank dummy

scoreboard objectives add heal_count dummy

scoreboard objectives add coin_count dummy
scoreboard objectives add coin_refill dummy
scoreboard objectives add coin_calc dummy
scoreboard objectives add coin_range dummy

scoreboard objectives add shotgun_ammo dummy
scoreboard objectives add using_shotgun_alt dummy

scoreboard objectives add difficulty dummy

scoreboard objectives add enemy_health dummy
scoreboard objectives add enemy_max_health dummy
scoreboard objectives add random_atk dummy
scoreboard objectives add enemy_raycast_range dummy
scoreboard objectives add atk1 dummy
scoreboard objectives add atk2 dummy
scoreboard objectives add atk3 dummy
scoreboard objectives add atk4 dummy
scoreboard objectives add atk5 dummy

scoreboard objectives add enemy_movement.x dummy
scoreboard objectives add enemy_movement.z dummy
scoreboard objectives add enemy_movement dummy
scoreboard objectives add player_predict dummy

scoreboard objectives add death_time dummy

scoreboard objectives add generic_invul dummy
scoreboard objectives add sword_invul dummy
scoreboard objectives add parry_invul dummy
scoreboard objectives add pistol_invul dummy
scoreboard objectives add pistol_alt_invul dummy
scoreboard objectives add machinegun_invul dummy
scoreboard objectives add machinegun_alt_invul dummy
scoreboard objectives add shotgun_invul dummy
scoreboard objectives add shotgun_alt_invul dummy

scoreboard objectives add lvl_0-1 dummy

scoreboard objectives add numbers dummy

#> Bossbars

bossbar add miniboss.sentry {"translate": "enemy.sentry"}
bossbar set miniboss.sentry color red

bossbar add boss.exterminator {"translate": "enemy.exterminator"}
bossbar set boss.exterminator color red