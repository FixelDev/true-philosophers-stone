extends Area2D

class_name SpellProjectile

var target: Vector2
var direction: Vector2

func _ready() -> void:
	direction = (target - self.global_position).normalized()
	look_at(target)
	
func _process(delta) -> void:
	position += direction * 100 * delta


func _on_body_entered(body):
	if body.has_node("HealthManager") :
		body.get_node("HealthManager").apply_damage(1)
	queue_free()
