# We round the coordinate to the next closest block
# Ex: coordinate is 34580
# 34580 -> 34 -> 34000 -> 39999
# Divide per factor -> Multiply by factor -> Remove 1

scoreboard players operation #next_coord u_raycast /= factor u_raycast
scoreboard players operation #next_coord u_raycast *= factor u_raycast
scoreboard players operation #next_coord u_raycast -= #1 u_raycast