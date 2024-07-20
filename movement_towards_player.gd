extends Movement


func move() -> void:
	var random_vector: Vector2 = Vector2(randf_range(-15, -10), randf_range(10, 15))
	character_body.velocity = ((player.global_position - character_body.global_position) + random_vector).normalized() * 20
