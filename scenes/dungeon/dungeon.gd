extends Node2D

class_name Dungeon

@onready var dungeon_spawner: DungeonSpawner

@export var player: Player
@export var camera: Camera2D


var current_room: Cell


func _ready() -> void:
	SignalManager.player_entered_dungeon_door.connect(_on_player_entered_dungeon_door)


func _on_dungeon_spawner_generation_finished(dungeon_spawner: DungeonSpawner):
	self.dungeon_spawner = dungeon_spawner
	player.global_position = dungeon_spawner.grid.get_grid_middle()
	camera.global_position = dungeon_spawner.grid.get_grid_middle()
	
	current_room = dungeon_spawner.grid.rooms[0]


func _on_player_entered_dungeon_door(direction_id: String) -> void:
	var direction: Vector2 = Globals.get_direction_by_id(direction_id)
	var fliped_direction: Vector2 = -direction
	
	var fliped_direction_id: String = Globals.get_direction_id(fliped_direction)
	
	
	var current_room_position: Vector2 = Vector2(current_room.x_pos, current_room.y_pos)
	var next_room_position: Vector2 = current_room_position + direction
	
	var next_room: Cell = dungeon_spawner.grid.get_cell(next_room_position)
	var player_spawn_position: Vector2 = next_room.room_scene.get_player_spawn_position(fliped_direction_id)
	player.global_position = player_spawn_position
	
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_property(camera, "global_position", next_room.room_scene.global_position, 0.3).set_trans(Tween.TRANS_CUBIC)
	
	
	current_room = next_room
