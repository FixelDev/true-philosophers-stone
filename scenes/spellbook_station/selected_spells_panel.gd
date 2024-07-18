extends Panel

@export var spellbook_slots: Array[SpellbookSlot]


func _ready() -> void:
	SpellDatabase.spell_equiped.connect(_on_spell_equiped)
	
	for id in SpellDatabase.equiped_spell_ids:
		equip_spell(id)


func _on_spell_equiped(id: String) -> void:
	equip_spell(id)


func equip_spell(id: String) -> void:
	for spellbook_slot in spellbook_slots:
		if spellbook_slot.has_spell():
			continue
		
		spellbook_slot.set_spell(id)
		break
