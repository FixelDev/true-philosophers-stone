extends Node2D


@export var room_scene: PackedScene





func _ready() -> void:
	generate_room_scenes()











func get_random_room() -> GridRoom:
	return rooms.pick_random()
	
	
func get_room_neighbors(room: GridRoom) -> String:
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


func generate_room_scene() -> Node2D:
	var room = room_scene.instantiate()
	add_child(room)
	
	return room
