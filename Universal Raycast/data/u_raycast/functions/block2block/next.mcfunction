## Move the ray one block further.
# @target: the ray
# @position: the ray's position

# Calculate the number of teleportation needed to go to the next block.
# Note: dir_x, dir_y and dir_z could equal 0. 
# When that happens, the division won't be executed, and the number of needed teleportations will be insanely huge.
# This is great! Because a direction of 0 means you will never change your coordinate for this axis.
# Therefore the number of teleportations should be greater than the other,
# so that the algorithm doesn't choose this direction as the smallest to go to the next block.

scoreboard players operation tp_x u_raycast = distance_remaining_x u_raycast
scoreboard players operation tp_x u_raycast *= factor u_raycast
scoreboard players operation tp_x u_raycast /= dir_x u_raycast

scoreboard players operation tp_y u_raycast = distance_remaining_y u_raycast
scoreboard players operation tp_y u_raycast *= factor u_raycast
scoreboard players operation tp_y u_raycast /= dir_y u_raycast

scoreboard players operation tp_z u_raycast = distance_remaining_z u_raycast
scoreboard players operation tp_z u_raycast *= factor u_raycast
scoreboard players operation tp_z u_raycast /= dir_z u_raycast

# Find the minimum value
scoreboard players set #minimum_tp u_raycast 2147483647
scoreboard players operation #minimum_tp u_raycast < tp_x u_raycast
scoreboard players operation #minimum_tp u_raycast < tp_y u_raycast
scoreboard players operation #minimum_tp u_raycast < tp_z u_raycast

# Now, calculate the new coordinate, and the remaining distances to go to the next one.
execute if score #minimum_tp u_raycast = tp_x u_raycast run function u_raycast:block2block/tp/smallest/x
execute unless score #minimum_tp u_raycast = tp_x u_raycast run function u_raycast:block2block/tp/not_smallest/x

execute if score #minimum_tp u_raycast = tp_y u_raycast run function u_raycast:block2block/tp/smallest/y
execute unless score #minimum_tp u_raycast = tp_y u_raycast run function u_raycast:block2block/tp/not_smallest/y

execute if score #minimum_tp u_raycast = tp_z u_raycast run function u_raycast:block2block/tp/smallest/z
execute unless score #minimum_tp u_raycast = tp_z u_raycast run function u_raycast:block2block/tp/not_smallest/z

# Now, we have the coordinates! Let's update the ray's coordinate
execute store result entity @s Pos[0] double 0.001 run scoreboard players get pos_x u_raycast
execute store result entity @s Pos[1] double 0.001 run scoreboard players get pos_y u_raycast
execute store result entity @s Pos[2] double 0.001 run scoreboard players get pos_z u_raycast