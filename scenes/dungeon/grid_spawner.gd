extends Node2D

class_name GridSpawner

@onready var rooms_holder = %RoomsHolder
@onready var camera_2d = $"../../Camera2D"

@export var dungeon_width: int
@export var dungeon_height: int
@export var rooms_amount: int
@export var chances_of_ending_branch: float
@export var room_scene: PackedScene

const DIRECTIONS: Array[Vector2] = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]

var grid: Grid
var grid_rooms: Array[GridRoom]


func _ready() -> void:
	grid = Grid.new(dungeon_width, dungeon_height)
	
	place_rooms_on_grid()
	generate_rooms() 
	assign_neighbors_to_rooms()
	
	camera_2d.global_position = grid.get_grid_middle()

func place_rooms_on_grid():
	var origin_position: Vector2 = Vector2(int(dungeon_width / 2), int(dungeon_height / 2))
	
	grid.place_room(origin_position.x, origin_position.y)
	
	var generated_rooms: int = 1
	
	while true:
		var next_pos: Vector2 = get_next_position(origin_position)
		
		var random_chance: float = 0
		
		if generated_rooms > 1:
			random_chance = randf_range(0, 1)
		
		if not grid.is_valid_position(next_pos) or grid.is_position_occupied(next_pos) or random_chance > chances_of_ending_branch:
			origin_position = grid.get_random_room_position()
			continue

		grid.place_room(next_pos.x, next_pos.y)
		origin_position = next_pos
		
		generated_rooms += 1
		
		if generated_rooms >= (rooms_amount - 1):
			break


func get_next_position(origin_position: Vector2) -> Vector2:
	var direction: Vector2 = DIRECTIONS.pick_random()
	var next_pos: Vector2 = origin_position + direction
	
	return next_pos
	
	
func generate_rooms() -> void:
	var i: int = 0
	
	for pos in grid.occupied_positions:
		var room = room_scene.instantiate()
		
		if i == 0:
			room.global_position = pos
		
		rooms_holder.add_child(room)
		
		var grid_room: GridRoom = GridRoom.new(pos.x, pos.y, room)
		grid_rooms.append(grid_room)


func assign_neighbors_to_rooms() -> void:
	for grid_room in grid_rooms:
		var grid_room_position: Vector2 = Vector2(grid_room.x_pos, grid_room.y_pos)
		
		for direction in DIRECTIONS:
			var neighbor_position: Vector2 = grid_room_position + direction
			
