summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["u_ray"]}

execute as @e[type=minecraft:area_effect_cloud,distance=..2,tag=u_ray,limit=1] run function u_raycast:block2block/initialize