extends Node2D

class_name DungeonSpawner

@onready var rooms_holder = %RoomsHolder

@export var dungeon_width: int
@export var dungeon_height: int
@export var rooms_amount: int
@export var chances_of_ending_branch: float
@export var room_scene: PackedScene
@export var player: Player

signal generation_finished(dungeon_spawner: DungeonSpawner)

var grid: Grid


func _ready() -> void:
	grid = Grid.new(dungeon_width, dungeon_height)
	
	place_rooms_on_grid()
	grid.assign_neigbhors_to_rooms()
	reposition_rooms()
	generation_finished.emit(self)
	
func place_rooms_on_grid():
	var origin_position: Vector2 = Vector2(int(dungeon_width / 2), int(dungeon_height / 2))
	
	var room: Room = room_scene.instantiate()
	rooms_holder.add_child(room)
	grid.place_room(origin_position, room)
	
	var generated_rooms: int = 1
	
	while true:
		origin_position = get_next_position(origin_position)
		
		var random_chance: float = 0
		
		if generated_rooms > 1:
			random_chance = randf_range(0, 1)
		
		if not grid.is_valid_position(origin_position) or grid.is_position_occupied(origin_position) or random_chance > chances_of_ending_branch:
			var random_room: Cell = grid.get_random_room()
			origin_position = Vector2(random_room.x_pos, random_room.y_pos)
			continue
		
		room = room_scene.instantiate()
		rooms_holder.add_child(room)
		grid.place_room(origin_position, room)
		
		generated_rooms += 1
		
		if generated_rooms >= (rooms_amount - 1):
			break
	
	grid.rooms[randi_range(7, grid.rooms.size() - 1)].set_as_exit_room()

func get_next_position(origin_position: Vector2) -> Vector2:
	var direction: Vector2 = Globals.DIRECTIONS.pick_random()
	var next_pos: Vector2 = origin_position + direction
	
	return next_pos
	
	
func reposition_rooms() -> void:
	grid.rooms[0].room_scene.change_position(grid.get_grid_middle())
	
	for room in grid.rooms:
		var room_position: Vector2 = Vector2(room.x_pos, room.y_pos)
		
		for neighbor in room.neighbors:
			var neighbor_position: Vector2 = Vector2(neighbor.x_pos, neighbor.y_pos)
			var direction: Vector2 = (neighbor_position - room_position).normalized()
			var direction_id = Globals.get_direction_id(direction)
			
			room.room_scene.enable_door(direction_id)
			
			if neighbor.room_scene.is_positioned:
				continue
			
			
			
			var spawn_position = room.room_scene.get_room_spawn_point_position(direction_id)
			
			neighbor.room_scene.change_position(spawn_position)
		
	
	
