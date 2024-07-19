extends Node2D

class_name Room

@onready var room_spawn_points_holder = %RoomSpawnPointsHolder

var is_positioned: bool = false



func change_position(new_pos: Vector2) -> void:
	global_position = new_pos
	is_positioned = true


func get_room_spawn_point_position(direction_id: String) -> Vector2:
	return get_node("RoomSpawnPointsHolder/" + direction_id).global_position
