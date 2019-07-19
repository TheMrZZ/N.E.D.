## This function initializes the raycast.
# @target: The entity used for raycasting
# @position @rotation: The owner's position & rotation

# Firt, get the direction of the ray.
tp @s ^ ^ ^

# Get the current position
execute store result score pos_x u_raycast run data get entity @s Pos[0] 1000
execute store result score pos_y u_raycast run data get entity @s Pos[1] 1000
execute store result score pos_z u_raycast run data get entity @s Pos[2] 1000

# Get the difference of position, which is a direction in 3D

# Teleport the ray 0.1 block forth.
# The ray don't need to have the rotation of the owner (unecessary calculation).
# We just teleporte it 0.1 block where the owner is looking, since this function is executed at the owner.
tp @s ^ ^ ^1

execute store result score dir_x u_raycast run data get entity @s Pos[0] 1000
execute store result score dir_y u_raycast run data get entity @s Pos[1] 1000
execute store result score dir_z u_raycast run data get entity @s Pos[2] 1000

scoreboard players operation dir_x u_raycast -= pos_x u_raycast
scoreboard players operation dir_y u_raycast -= pos_y u_raycast
scoreboard players operation dir_z u_raycast -= pos_z u_raycast

# Teleport it back to the previous position.
tp @s ~ ~ ~

# Now, we can get the starting coordinates of the ray.
# For a reason I ignore, using /tp ^ ^ ^ gives the good direction but wrong coordinates,
# and using /tp ~ ~ ~ ~ ~ gives the good coordinates but wrong directiion.
execute store result score pos_x u_raycast run data get entity @s Pos[0] 1000
execute store result score pos_y u_raycast run data get entity @s Pos[1] 1000
execute store result score pos_z u_raycast run data get entity @s Pos[2] 1000


# Calculate the next position
scoreboard players operation dir u_raycast = dir_x u_raycast
scoreboard players operation #next_coord u_raycast = pos_x u_raycast
function u_raycast:block2block/get_next_coord
scoreboard players operation next_x u_raycast = #next_coord u_raycast

scoreboard players operation dir u_raycast = dir_y u_raycast
scoreboard players operation #next_coord u_raycast = pos_y u_raycast
function u_raycast:block2block/get_next_coord
scoreboard players operation next_y u_raycast = #next_coord u_raycast

scoreboard players operation dir u_raycast = dir_z u_raycast
scoreboard players operation #next_coord u_raycast = pos_z u_raycast
function u_raycast:block2block/get_next_coord
scoreboard players operation next_z u_raycast = #next_coord u_raycast

# Calculate the distance remaining between current position & next block    
scoreboard players operation distance_remaining_x u_raycast = next_x u_raycast
scoreboard players operation distance_remaining_x u_raycast -= pos_x u_raycast

scoreboard players operation distance_remaining_y u_raycast = next_y u_raycast
scoreboard players operation distance_remaining_y u_raycast -= pos_y u_raycast

scoreboard players operation distance_remaining_z u_raycast = next_z u_raycast
scoreboard players operation distance_remaining_z u_raycast -= pos_z u_raycast

# Calculate the distance between 2 blocks
scoreboard players operation distance_between_blocks_x u_raycast = factor u_raycast
execute if score dir_x u_raycast matches ..0 run scoreboard players operation distance_between_blocks_x u_raycast = negative_factor u_raycast

scoreboard players operation distance_between_blocks_y u_raycast = factor u_raycast
execute if score dir_y u_raycast matches ..0 run scoreboard players operation distance_between_blocks_y u_raycast = negative_factor u_raycast

scoreboard players operation distance_between_blocks_z u_raycast = factor u_raycast
execute if score dir_z u_raycast matches ..0 run scoreboard players operation distance_between_blocks_z u_raycast = negative_factor u_raycast