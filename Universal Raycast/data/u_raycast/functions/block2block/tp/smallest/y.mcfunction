## Calculate the new y coordinate, the next one, and the distance remaining
## when the smallest number of teleportations required is along the y axis.

scoreboard players operation pos_y u_raycast = next_y u_raycast
scoreboard players operation next_y u_raycast += distance_between_blocks_y u_raycast
scoreboard players operation distance_remaining_y u_raycast = distance_between_blocks_y u_raycast