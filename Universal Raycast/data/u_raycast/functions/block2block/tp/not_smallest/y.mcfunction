## Calculate the new y coordinate, the next one, and the distance remaining
## when the smallest number of teleportations required is along the y axis.

# Calculate the distance that will be made with the next teleportation
scoreboard players operation #distance_y u_raycast = dir_y u_raycast
scoreboard players operation #distance_y u_raycast *= #minimum_tp u_raycast
scoreboard players operation #distance_y u_raycast /= factor u_raycast

# Add it to the coordinate, and substract it from the distance remaining
scoreboard players operation pos_y u_raycast += #distance_y u_raycast
scoreboard players operation distance_remaining_y u_raycast -= #distance_y u_raycast