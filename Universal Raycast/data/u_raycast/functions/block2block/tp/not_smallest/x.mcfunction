## Calculate the new x coordinate, the next one, and the distance remaining
## when the smallest number of teleportations required is NOT along the x axis.

# Calculate the distance that will be made with the next teleportation
scoreboard players operation #distance_x u_raycast = dir_x u_raycast
scoreboard players operation #distance_x u_raycast *= #minimum_tp u_raycast
scoreboard players operation #distance_x u_raycast /= factor u_raycast

# Add it to the coordinate, and substract it from the distance remaining
scoreboard players operation pos_x u_raycast += #distance_x u_raycast
scoreboard players operation distance_remaining_x u_raycast -= #distance_x u_raycast