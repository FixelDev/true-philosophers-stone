extends Node

signal coins_amount_changed()

enum ItemType {RECIPE, INGREDIENT}

var coins: int = 150:
	get:
		return coins
	
	set(value):
		coins = value
		coins_amount_changed.emit()
