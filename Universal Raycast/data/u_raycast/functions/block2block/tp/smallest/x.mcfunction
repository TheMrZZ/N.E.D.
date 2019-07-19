## Calculate the new x coordinate, the next one, and the distance remaining
## when the smallest number of teleportations required is along the x axis.

scoreboard players operation pos_x u_raycast = next_x u_raycast
scoreboard players operation next_x u_raycast += distance_between_blocks_x u_raycast
scoreboard players operation distance_remaining_x u_raycast = distance_between_blocks_x u_raycast