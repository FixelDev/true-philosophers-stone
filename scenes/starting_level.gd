extends Node2D

@export var entrance_shop: Entrance


func _ready() -> void:
	print("Boss defeated: " + str(LevelManager.boss_defeat_counter))
	
	if LevelManager.get_current_level_type() == LevelManager.LevelType.NORMAL_LEVEL:
		entrance_shop.visible = false
		entrance_shop.get_node("EnterArea").disabled = true
