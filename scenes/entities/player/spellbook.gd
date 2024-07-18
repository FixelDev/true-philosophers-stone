extends Node

class_name Spellbook


func get_spells_amount() -> int:
	return get_children().size()


func get_spell_by_index(index: int):
	return get_child(index)
