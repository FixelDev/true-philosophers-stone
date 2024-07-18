extends ColorRect

class_name SpellbookSlot

@onready var remove_button: Button = $RemoveButton
@onready var spell_name_text: Label = $SpellNameText

var spell_id: String = ""


func _ready() -> void:
	SpellDatabase.spell_unequiped.connect(_on_spell_unequiped)


func set_spell(id: String) -> void:
	spell_id = id
	update_ui()
	

func update_ui() -> void:
	if not has_spell():
		spell_name_text.text = ""
		remove_button.visible = false
		return
		
	spell_name_text.text = RecipesDatabase.get_recipe(spell_id).name
	remove_button.visible = true


func has_spell() -> bool:
	return spell_id != ""


func clear_slot() -> void:
	spell_id = ""
	update_ui()


func _on_spell_unequiped(id: String) -> void:
	if spell_id == id:
		clear_slot()


func _on_remove_button_pressed():
	SpellDatabase.unequip_spell(spell_id)
