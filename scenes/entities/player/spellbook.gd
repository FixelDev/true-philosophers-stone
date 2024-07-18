extends Node

class_name Spellbook


func add_equiped_spells() -> void:
	for id in SpellDatabase.equiped_spell_ids:
		var spell_scene: PackedScene = SpellDatabase.get_spell_scene(id)
		var spell: Spell = spell_scene.instantiate()
		add_child(spell)


func get_spells_amount() -> int:
	return get_children().size()


func get_spell_by_index(index: int) -> Spell:
	return get_child(index)
