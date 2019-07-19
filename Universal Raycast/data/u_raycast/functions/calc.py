factor = 10_000


def get_next(current, direction):
    for i in range(3):
        if direction[i] > 0:
            yield (current[i] // factor + 1) * factor
        elif direction[i] < 0:
            yield current[i] // factor * factor - 1
        else:
            yield current[i] + factor * 10


def main(starting_pos, dir):
    def get_block(*blocks): return tuple(int(i // factor) for i in blocks)

    # Init from data, with a given factor
    starting_pos = map(lambda p: int(factor * p), starting_pos)
    dir = map(lambda d: int(factor * d), dir)

    pos_x, pos_y, pos_z = starting_pos
    dir_x, dir_y, dir_z = dir

    print('Starting from', get_block(pos_x, pos_y, pos_z),
          'with direction', dir_x / factor, dir_y / factor, dir_z / factor)

    # Get the next coordinates
    next_x = pos_x
    next_y = pos_y
    next_z = pos_z

    # Only for Python
    dir = None
    next_coord = None

    # Function get_next_coord
    def get_next_coord():
        nonlocal dir
        nonlocal next_coord
        if dir > 0:
            next_coord //= factor
            next_coord += 1
            next_coord *= factor
        if dir < 0:
            next_coord //= factor
            next_coord *= factor
            next_coord -= 1
        if dir == 0:
            next_coord += factor
            next_coord += factor

    dir = dir_x
    next_coord = pos_x
    get_next_coord()
    next_x = next_coord

    dir = dir_y
    next_coord = pos_y
    get_next_coord()
    next_y = next_coord

    dir = dir_z
    next_coord = pos_z
    get_next_coord()
    next_z = next_coord

    # Hold the distance between current & next coordinates
    distance_remaining_x = next_x
    distance_remaining_x -= pos_x

    distance_remaining_y = next_y
    distance_remaining_y -= pos_y

    distance_remaining_z = next_z
    distance_remaining_z -= pos_z

    # The distance between 2 blocks when the raycast is at the beginning of a block
    distance_between_blocks_x = factor
    if dir_x < 0:
        distance_between_blocks_x = -factor

    distance_between_blocks_y = factor
    if dir_y < 0:
        distance_between_blocks_y = -factor

    distance_between_blocks_z = factor
    if dir_z < 0:
        distance_between_blocks_z = -factor

    # Now, we have the remaining distance between the raycast and the next block.
    # This value will be updated by hand in each loop.

    # In the datapack, this won't be a for loop.
    # This function will be called by the user himself.
    for _ in range(factor):
        # Function datapack:block2block/next

        # Number of teleportations needed to go to the next coordinates
        tp_x = distance_remaining_x
        tp_x *= factor
        if dir_x != 0:
            tp_x //= dir_x

        tp_y = distance_remaining_y
        tp_y *= factor
        if dir_y != 0:
            tp_y //= dir_y

        tp_z = distance_remaining_z
        tp_z *= factor
        if dir_z != 0:
            tp_z //= dir_z

        # Find the direction with the lowest needed teleportations to go to another block
        # 3 scoreboard operations
        minimum_tp = min(tp_x, tp_y, tp_z)

        # Now, we know the number of tp needed to reach the next block.
        # We multiply this number by the direction of the raycast, and we get the distance to add to the current coordinate to get the next one !
        # "distance_?" holds the distance the raycast will travel
        if minimum_tp == tp_x:
            pos_x = next_x
            next_x += distance_between_blocks_x
            distance_remaining_x = distance_between_blocks_x
        else:
            distance_x = dir_x
            distance_x *= minimum_tp
            distance_x //= factor
            pos_x += distance_x
            distance_remaining_x -= distance_x

        if minimum_tp == tp_y:
            pos_y = next_y
            next_y += distance_between_blocks_y
            distance_remaining_y = distance_between_blocks_y
        else:
            distance_y = dir_y
            distance_y *= minimum_tp
            distance_y //= factor
            pos_y += distance_y
            distance_remaining_y -= distance_y

        if minimum_tp == tp_z:
            pos_z = next_z
            next_z += distance_between_blocks_z
            distance_remaining_z = distance_between_blocks_z
        else:
            distance_z = dir_z
            distance_z *= minimum_tp
            distance_z //= factor
            pos_z += distance_z
            distance_remaining_z -= distance_z

        # print('Best axis is', 'xyz'[(tp_x, tp_y, tp_z).index(minimum_tp)])
        print('Next block is', get_block(pos_x, pos_y, pos_z))


if __name__ == "__main__":
    main((0, 0, 0), (0.3, 0.3, 0))
