extends Node


@export var spells: Dictionary
@export var available_spell_ids: Array[String]
@export var equiped_spell_ids: Array[String]

signal spell_equiped(id: String)
signal spell_unequiped(id: String)


func add_new_spell(id: String) -> void:
	available_spell_ids.append(id)


func equip_spell(id: String) -> void:
	equiped_spell_ids.append(id)
	spell_equiped.emit(id)


func unequip_spell(id: String) -> void:
	var i: int = 0
	for spell_id in equiped_spell_ids:
		if spell_id == id:
			equiped_spell_ids.remove_at(i)
			spell_unequiped.emit(id)
			break
		i += 1


func get_spell_scene(id: String) -> PackedScene:
	return spells[id]
