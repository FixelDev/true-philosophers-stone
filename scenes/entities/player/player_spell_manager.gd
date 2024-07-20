extends Node2D

@onready var spellbook: Spellbook = %Spellbook

var current_spell_index: int = 0
var spells_amount: int
var equiped_spell: Spell


func _ready() -> void:
	spellbook.add_equiped_spells()
	spells_amount = spellbook.get_spells_amount()
	equip_spell()

func _process(_delta) -> void:
	handle_changing_spells()
	handle_casting_spells()
		

func handle_changing_spells() -> void:
	if Input.is_action_just_released("change_spell_up"):
		current_spell_index += 1
		
		if current_spell_index >= spells_amount:
			current_spell_index = 0
		equip_spell()
		
	if Input.is_action_just_released("change_spell_down"):
		current_spell_index -= 1
		
		if current_spell_index < 0:
			current_spell_index = spells_amount - 1
		equip_spell()

func equip_spell() -> void:
	equiped_spell = spellbook.get_spell_by_index(current_spell_index)
	print(equiped_spell.name)

func handle_casting_spells() -> void:
	if Input.is_action_just_pressed("cast_spell"):
		equiped_spell.cast_spell(get_global_mouse_position())
