extends CharacterBody2D

class_name Player

const SPEED: float = 100.0
var current_x_velocity: float = velocity.x
var current_y_velocity: float = velocity.y

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()
