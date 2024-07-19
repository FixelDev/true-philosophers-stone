extends Node

signal coins_amount_changed()

enum ItemType {RECIPE, INGREDIENT}

const DIRECTIONS: Array[Vector2] = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]

var coins: int = 150:
	get:
		return coins
	
	set(value):
		coins = value
		coins_amount_changed.emit()
		

func get_direction_id(pos: Vector2) -> String:
	var id: String = ""
	
	match pos:
		Vector2.UP:
			id = "t"
		Vector2.RIGHT:
			id = "r"
		Vector2.DOWN:
			id = "b"
		Vector2.LEFT:
			id = "l"
			
	return id
	
func get_direction_by_id(id: String) -> Vector2:
	var direction: Vector2
	
	match id:
		"t":
			direction = Vector2.UP
		"r":
			direction = Vector2.RIGHT
		"b":
			direction = Vector2.DOWN
		"l":
			direction = Vector2.LEFT
	return direction
