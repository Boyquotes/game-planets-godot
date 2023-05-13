
# adapted from edge_coords_starting_logic.js
# function that is used on known edge tiles to determine their linked tiles
# this will be a fork in the road, splitting off into each algorithm

func edge_tile_redirect_logic(coords_to_check, edge_tile_pair_dict):
	if edge_tile_pair_dict[coords_to_check].size() > 1:
		print(edge_tile_pair_dict[coords_to_check])
