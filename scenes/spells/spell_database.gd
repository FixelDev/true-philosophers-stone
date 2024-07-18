extends Node


@export var spell_scenes: Array[PackedScene]
@export var available_spell_ids: Array[String]
@export var equiped_spell_ids: Array[String]


func add_new_spell(id: String) -> void:
	available_spell_ids.append(id)
