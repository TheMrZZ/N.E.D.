execute if score dir u_raycast matches 0.. run function u_raycast:block2block/get_next_coord/positive_dir
execute if score dir u_raycast matches ..0 run function u_raycast:block2block/get_next_coord/negative_dir
execute if score dir u_raycast matches 0 run function u_raycast:block2block/get_next_coord/null_dir