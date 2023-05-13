
# adapted from edge_coords_starting_logic.js
# function that is used on known edge tiles to determine their linked tiles
# this will be a fork in the road, splitting off into each algorithm

func edge_tile_redirect_logic(coords_to_check, edge_tile_pair_dict, map_size, section_size, equator):
    # don't forget that north/south are flipped, so y + 1 moves south
    var x_in = coords_to_check[0]
    var y_in = coords_to_check[1]
    var hemisphere = "southern" if coords_to_check[1] > equator else "northern"
    var section_column = ceil(x_in / section_size)
    var slice_column = section_column % map_size
    var secondary_direction = "east" if slice_column > 1 && slice_column <= map_size /2 + 1 else "west"


    # TODO: rework logic as you go to account for Y being opposite what we planned

    # using a loop because some coords will have more than one direction
    var x_in
    var y_in
    for i in edge_tile_pair_dict[coords_to_check]
        x_in = coords_to_check[0]
        y_in = coords_to_check[1]
        if hemisphere == "southern"
            if i == "west"
                # SOUTH HEM LEFT
            elif i == "east"
                # SOUTH HEM RIGHT
            elif i == "south" && secondary_direction == "east"
                # SOUTH HEM DOWN RIGHT
            elif i == "south" && secondary_direction == "west"
                # SOUTH HEM DOWN LEFT
        elif hemisphere == "northern"
            if i == "west"
                # NORTH HEM LEFT
                edge_tile_pair_dict[coords_to_check[0]][coords_to_check[1]]["west"] = north_hem_left(map_size, section_size, section_column, x_in, y_in)
            elif i == "east"
                # NORTH HEM RIGHT
            elif i == "north" && secondary_direction == "east"
                # NORTH HEM UP RIGHT
            elif i == "north" && secondary_direction == "west"
                # NORTH HEM UP LEFT