## Calculate the new z coordinate, the next one, and the distance remaining
## when the smallest number of teleportations required is along the z axis.

scoreboard players operation pos_z u_raycast = next_z u_raycast
scoreboard players operation next_z u_raycast += distance_between_blocks_z u_raycast
scoreboard players operation distance_remaining_z u_raycast = distance_between_blocks_z u_raycast