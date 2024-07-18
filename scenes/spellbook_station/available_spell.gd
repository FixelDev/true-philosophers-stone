extends Button

class_name AvailableSpell

var spell_id: String


func _ready() -> void:
	SpellDatabase.spell_equiped.connect(_on_spell_equiped)


func set_spell(id: String) -> void:
	spell_id = id
	
	update_ui()


func update_ui() -> void:
	self.text = RecipesDatabase.get_recipe(spell_id).name


func _on_spell_equiped(id: String):
	if id == spell_id:
		queue_free()


func _on_pressed():
	SpellDatabase.equip_spell(spell_id)
