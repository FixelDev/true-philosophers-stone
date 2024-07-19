extends Node2D

@export var dungeon_width: int
@export var dungeon_height: int
@export var rooms_amount: int
@export var chances_of_ending_branch: float
@export var room_scenes: Dictionary

var grid = []
var rooms: Array[Room]
var directions: Array[Vector2] = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]


func _ready() -> void:
	generate_grid()
	generate_rooms() 
	generate_room_scenes()


func generate_grid() -> void:
	for i in range(dungeon_width):
		grid.append([])
		for j in range(dungeon_height):
			grid[i].append(0)	


func generate_rooms() -> void:
	var start_pos: Vector2 = Vector2(int(dungeon_width / 2), int(dungeon_height / 2))
	
	grid[start_pos.x][start_pos.y] = 1
	
	var starting_room: Room = Room.new(start_pos.x, start_pos.y)
	rooms.append(starting_room)

	
	var origin_room: Room = starting_room
	
	
	var i: int = 0
	
	while true:
		var direction: Vector2 = directions.pick_random()
		var next_pos: Vector2 = start_pos + direction
		var random_chance: float = 0
		
		if rooms.size() > 1:
			random_chance = randf_range(0, 1)
		
		if not is_valid_position(next_pos) or is_position_occupied(next_pos) or random_chance > chances_of_ending_branch:
			origin_room = get_random_room()
			start_pos = Vector2(origin_room.x_pos, origin_room.y_pos)
			continue
		
		var new_room = Room.new(next_pos.x, next_pos.y)
		rooms.append(new_room)
		grid[next_pos.x][next_pos.y] = 1
		origin_room = new_room
		start_pos = Vector2(origin_room.x_pos, origin_room.y_pos)
		
		
		
		i += 1
		
		if i >= (rooms_amount - 1):
			break


func is_position_occupied(pos: Vector2) -> bool:
	return grid[pos.x][pos.y] == 1


func is_valid_position(pos: Vector2) -> bool:
	return pos.x > 0 and pos.x < dungeon_width and pos.y > 0 and pos.y < dungeon_height


func get_random_room() -> Room:
	return rooms.pick_random()
	
	
func get_room_neighbors(room: Room) -> String:
	var origin: Vector2 = Vector2(room.x_pos, room.y_pos)
	var neighbors: String = ""
	
	for direction: Vector2 in directions:
		var neighbor_position: Vector2 = origin + direction
		
		if is_valid_position(neighbor_position) and is_position_occupied(neighbor_position):
			neighbors += get_direction_id(direction)
		
	return neighbors


func get_direction_id(pos: Vector2) -> String:
	var id: String = ""
	
	match pos:
		Vector2.UP:
			id = "t"
		Vector2.RIGHT:
			id = "r"
		Vector2.DOWN:
			id = "b"
		Vector2.LEFT:
			id = "l"
			
	return id


func generate_room_scenes() -> void:
	var i: int = 0
	
	for room in rooms:
		var neighbors: String = get_room_neighbors(room)
		var new_room_scene: Node2D = room_scenes[neighbors].instantiate()
		if i == 0:
			new_room_scene.get_child(0).modulate = Color.BLACK
		
		add_child(new_room_scene)
		new_room_scene.global_position = Vector2(room.x_pos * 16, room.y_pos * 16)
		i += 1
	pass
