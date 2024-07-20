extends Area2D

class_name RoomDoor


@export var corresponding_neighbor_dir: String

var is_opened: bool = true

func enable() -> void:
	visible = true
	%EnterArea.disabled = false


func _on_body_entered(body):
	if not is_opened:
		return
	
	SignalManager.player_entered_dungeon_door.emit(corresponding_neighbor_dir)


func get_player_spawn_point() -> Vector2:
	return $PlayerSpawnPoint.global_position
