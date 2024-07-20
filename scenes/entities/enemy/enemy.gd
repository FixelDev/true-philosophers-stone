extends CharacterBody2D

@export var movement: Movement


func _ready() -> void:
	movement.set_character_body(self)


func _process(delta) -> void:
	movement.move()
	move_and_slide()
