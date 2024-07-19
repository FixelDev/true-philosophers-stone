extends Node

class_name Grid

var width: int
var height: int
var grid = []
var occupied_positions: Array[Vector2]

func _init(grid_width: int, grid_height: int) -> void:
	width = grid_width
	height = grid_height
	
	for i in range(width):
		grid.append([])
		
		for j in range(height):
			grid[i].append(0)	
			
			
func place_room(x_pos: int, y_pos: int) -> void:
	grid[x_pos][y_pos] = 1
	occupied_positions.append(Vector2(x_pos, y_pos))
	

func get_random_room_position() -> Vector2:
	return occupied_positions.pick_random()
	

func is_position_occupied(pos: Vector2) -> bool:
	return occupied_positions.has(pos)


func is_valid_position(pos: Vector2) -> bool:
	return pos.x > 0 and pos.x < width and pos.y > 0 and pos.y < height
	
	
func get_grid_middle() -> Vector2:
	return Vector2(int(width / 2), int(height / 2))
