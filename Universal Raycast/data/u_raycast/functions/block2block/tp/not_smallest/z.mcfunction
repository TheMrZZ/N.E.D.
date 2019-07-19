## Calculate the new z coordinate, the next one, and the distance remaining
## when the smallest number of teleportations required is along the z axis.

# Calculate the distance that will be made with the next teleportation
scoreboard players operation #distance_z u_raycast = dir_z u_raycast
scoreboard players operation #distance_z u_raycast *= #minimum_tp u_raycast
scoreboard players operation #distance_z u_raycast /= factor u_raycast

# Add it to the coordinate, and substract it from the distance remaining
scoreboard players operation pos_z u_raycast += #distance_z u_raycast
scoreboard players operation distance_remaining_z u_raycast -= #distance_z u_raycast