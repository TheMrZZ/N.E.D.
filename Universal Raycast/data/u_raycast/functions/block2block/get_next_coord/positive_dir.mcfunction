# We round the coordinate to the next closest block
# Ex: coordinate is 34580
# 34580 -> 34 -> 35 -> 35000
# Divide per factor -> add 1 -> Multiply by factor

scoreboard players operation #next_coord u_raycast /= factor u_raycast
scoreboard players operation #next_coord u_raycast += #1 u_raycast
scoreboard players operation #next_coord u_raycast *= factor u_raycast