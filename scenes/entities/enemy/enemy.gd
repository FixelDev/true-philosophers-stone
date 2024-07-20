extends CharacterBody2D

class_name Enemy

@export var movement: Movement
@export var health_manager: HealthManager

func _ready() -> void:
	movement.set_character_body(self)
	health_manager.set_character_body(self)


func _process(delta) -> void:
	movement.move()
	move_and_slide()


