extends Control


func change_scene_by_path(path: String) -> void:
	get_tree().call_deferred("change_scene_to_file", path)


func change_scene_by_packed_scene(scene: PackedScene) -> void:
	get_tree().call_deferred("change_scene_to_packed", scene)
