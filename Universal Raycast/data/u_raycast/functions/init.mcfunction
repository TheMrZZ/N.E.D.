# Contains all the data of a raycast
scoreboard objectives add u_raycast dummy

# The factor used when getting the position of the ray
scoreboard players set factor u_raycast 1000

# The negative factor is used somewhere in the algorithm
scoreboard players set negative_factor u_raycast 0
scoreboard players operation negative_factor u_raycast -= factor u_raycast

scoreboard players set #1 u_raycast 1