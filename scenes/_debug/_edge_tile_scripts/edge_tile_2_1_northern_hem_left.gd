
# adapted from edge_coords_north-hem_left.js

func edge_tile_northern_hem_left(map_size, section_size, section_column, x_in, y_in):
    var section_row = ceil(y_in / section_size)
    var section_gap
    var y_in_mod = y_in % section_size
    var map_height_tiles = (map_size * 2) * section_size

    match (section_row):
        1:
            section_gap = map_size - 2
        2:
            section_gap = map_size - 4
        3:
            section_gap = map_size - 6
        4:
            section_gap = map_size - 8
        5:
            section_gap = map_size - 10
        6:
            section_gap = map_size - 12
        7:
            section_gap = map_size - 14
        8:
            section_gap = map_size - 16
        9:
            section_gap = map_size - 18
        10:
            section_gap = map_size - 20
        11:
            section_gap = map_size - 22
        12:
            section_gap = map_size - 24
        13:
            section_gap = map_size - 26
        14:
            section_gap = map_size - 28
        15:
            section_gap = map_size - 30
        16:
            section_gap = map_size - 32


    
    var section_gap_tiles = section_gap * section_size
    var x_out = x_in - (section_gap_tiles + y_in_mod)
    var y_out = map_height_tiles - (section_row * section_size)
    x_out = x_out -= blocksize if x_in % section_size == 1 && y_in % section_size == 0 else x_out

    print("input: ", x_in, ", ", y_in)
    print("output: ", x_out ", ", y_out )

    return [x_out, y_out]