extends Panel

@export var available_spell_scene: PackedScene
@onready var available_spells_grid: GridContainer = %AvailableSpellsGrid


func _ready() -> void:
	SpellDatabase.spell_unequiped.connect(_on_spell_unequiped)
	
	
	for id in SpellDatabase.available_spell_ids:
		if SpellDatabase.equiped_spell_ids.has(id):
			continue
		
		instantiate_available_spell(id)


func _on_spell_unequiped(id: String):
	instantiate_available_spell(id)
	

func instantiate_available_spell(id: String) -> void:
	var available_spell: AvailableSpell = available_spell_scene.instantiate()
	available_spells_grid.add_child(available_spell)
	available_spell.set_spell(id)
