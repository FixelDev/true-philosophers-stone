extends Spell

class_name DefaultSpell

@export var spell_projectile_scene: PackedScene

func cast(target: Vector2) -> void:
	var projectile: SpellProjectile = spell_projectile_scene.instantiate()
	projectile.target = target
	projectile.global_position = self.global_position
	get_tree().root.add_child(projectile)
	
	
	
