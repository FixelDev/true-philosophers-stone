extends Node2D

class_name Room

@export var exit_hatch: ExitHatch
@export var enemy_scene: PackedScene

@onready var room_spawn_points_holder = %RoomSpawnPointsHolder

enum RoomType {NORMAL_ROOM, DANGER_ROOM, TREASURE_ROOM}

var is_positioned: bool = false
var room_type: RoomType = RoomType.NORMAL_ROOM


func change_position(new_pos: Vector2) -> void:
	global_position = new_pos
	is_positioned = true


func get_room_spawn_point_position(direction_id: String) -> Vector2:
	return get_node("RoomSpawnPointsHolder/" + direction_id).global_position
	

func enable_door(direction_id: String) -> void:
	for door in %DoorsHolder.get_children():
		if door.corresponding_neighbor_dir == direction_id:
			door.enable()


func get_player_spawn_position(direction_id: String) -> Vector2:
	for door in %DoorsHolder.get_children():
		if door.corresponding_neighbor_dir == direction_id:
			return door.get_player_spawn_point()
			
	return Vector2.ZERO


func enable_exit_hatch() -> void:
	exit_hatch.visible = true
	exit_hatch.get_node("EnterArea").disabled = false


func change_room_type(new_room_type: RoomType) -> void:
	room_type = new_room_type


func _on_player_entered_door(direction_id: String) -> void:
	pass


func on_player_entered_room() -> void:
	if room_type == RoomType.DANGER_ROOM:
		var enemy = enemy_scene.instantiate()
		call_deferred("add_child", enemy)
	elif room_type == RoomType.TREASURE_ROOM:
		print("There is a chest")
	else:
		print("Empty room")
