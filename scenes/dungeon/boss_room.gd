extends Node2D

@export var true_elements_displayer_scene: PackedScene

func _on_test_exit_area_body_entered(body):
	LevelManager.defeat_boss()
	LevelManager.increase_level_index()
	SceneManager.change_scene_by_packed_scene(true_elements_displayer_scene)
