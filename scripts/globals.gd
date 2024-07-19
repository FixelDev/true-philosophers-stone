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
