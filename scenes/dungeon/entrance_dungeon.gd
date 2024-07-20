extends Area2D

@export var dungeon_scene: PackedScene
@export var boss_room_scene: PackedScene



func _on_body_entered(body):
	var scene_to_load: PackedScene
	
	if LevelManager.get_current_level_type() == LevelManager.LevelType.BOSS_LEVEL:
		scene_to_load = boss_room_scene
	else:
		scene_to_load = dungeon_scene
	SceneManager.change_scene_by_packed_scene(scene_to_load)
