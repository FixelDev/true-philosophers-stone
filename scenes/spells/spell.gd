extends Node

class_name Spell

@export var spell_stats: SpellStats
@onready var timer: Timer = $Timer

var can_be_casted: bool = true

func cast_spell(target: Vector2) -> void:
	
	if not can_be_casted:
		return
	
	cast(target)
	
	can_be_casted = false
	timer.start()
	

func cast(target: Vector2) -> void:
	pass


func _on_timer_timeout():
	can_be_casted = true
