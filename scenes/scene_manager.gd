extends Control


func change_scene(path: String) -> void:
	get_tree().change_scene_to_file(path)
