extends Node2D

class_name HealthManager

@export var health: int

var character_body: CharacterBody2D

func set_character_body(character_body: CharacterBody2D) -> void:
	self.character_body = character_body

func apply_damage(damage: int) -> void:
	health -= damage
	
	if health <= 0:
		die()


func die() -> void:
	character_body.queue_free()
