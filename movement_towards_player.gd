extends Movement


func move() -> void:
	character_body.velocity = (player.global_position - character_body.global_position).normalized() * 20
