extends Node

class_name Grid

var width: int
var height: int
var grid = []
var rooms: Array[Cell]

func _init(grid_width: int, grid_height: int) -> void:
	width = grid_width
	height = grid_height
	
	for i in range(width):
		grid.append([])
		
		for j in range(height):
			var cell: Cell = Cell.new(i, j)
			grid[i].append(cell)	
			
			
func place_room(pos: Vector2, room: Room) -> void:
	var cell: Cell = get_cell(pos)
	cell.change_cell_type(Cell.CellType.ROOM)
	cell.room_scene = room
	rooms.append(cell)
	

func get_random_room() -> Cell:
	return rooms.pick_random()
	

func is_position_occupied(pos: Vector2) -> bool:
	return get_cell(pos).cell_type == Cell.CellType.ROOM


func is_valid_position(pos: Vector2) -> bool:
	return pos.x > 0 and pos.x < width and pos.y > 0 and pos.y < height
	
	
func get_grid_middle() -> Vector2:
	return Vector2(int(width / 2), int(height / 2))
	

func get_cell(pos: Vector2) -> Cell:
	return grid[pos.x][pos.y]


func assign_neigbhors_to_rooms() -> void:
	for room in rooms:
		var room_position: Vector2 = Vector2(room.x_pos, room.y_pos)
		
		for direction in Globals.DIRECTIONS:
			var neighbor_position: Vector2 = room_position + direction
			
			if is_valid_position(neighbor_position) and is_position_occupied(neighbor_position):
				var neighbor: Cell = get_cell(neighbor_position)
				room.assign_neighbor(neighbor)
