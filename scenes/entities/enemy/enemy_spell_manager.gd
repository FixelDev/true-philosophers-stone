extends Node2D

var spell: Spell

func _ready() -> void:
	spell = get_child(0)


func _process(delta):
	spell.cast_spell(get_tree().get_nodes_in_group("Player")[0].global_position)
