extends Area2D

class_name ExitHatch


func enable() -> void:
	visible = true
	$EnterArea.set_deferred("disabled", false)


func _on_body_entered(body):
	LevelManager.increase_level_index()
	SceneManager.change_scene_by_path("res://scenes/starting_level.tscn")
