extends Node

enum LevelType {NORMAL_LEVEL, NORMAL_LEVEL_WITH_SHOP, BOSS_LEVEL}

#var game_structure: Array[LevelType] = [
	#LevelType.NORMAL_LEVEL_WITH_SHOP,
	#LevelType.NORMAL_LEVEL,
	#LevelType.NORMAL_LEVEL,
	#LevelType.BOSS_LEVEL,
#]

var game_structure: Array[LevelType] = [
	LevelType.NORMAL_LEVEL,
	LevelType.BOSS_LEVEL,
]

var current_level_index: int = 0
var boss_defeat_counter: int = 0

func get_current_level_type() -> LevelType:
	return game_structure[current_level_index]
	

func increase_level_index() -> void:
	current_level_index += 1
	
	if current_level_index >= game_structure.size():
		current_level_index = 0


func defeat_boss() -> void:
	boss_defeat_counter += 1
