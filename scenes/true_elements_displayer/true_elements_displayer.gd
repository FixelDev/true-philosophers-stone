extends Control


@export var true_elements_holder: HBoxContainer


func _ready() -> void:
	for i in range(LevelManager.boss_defeat_counter):
		true_elements_holder.get_child(i).visible = true


func _on_timer_timeout():
	SceneManager.change_scene_by_path("res://scenes/starting_level.tscn")
