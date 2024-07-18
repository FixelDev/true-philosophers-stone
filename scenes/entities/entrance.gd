extends Area2D

class_name Entrance

@export var scene_to_load: PackedScene

var is_open: bool = true


func _on_body_entered(body):
	if not is_open:
		return
		
	
	SceneManager.call_deferred("change_scene_by_packed_scene", scene_to_load)
