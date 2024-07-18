extends Node

class_name IngredientsContainer


@export var available_ingredients: Dictionary

signal ingredients_amount_changed(id: String)


func add_ingredient(id: String, amount_to_add: int) -> void:
	if not available_ingredients.has(id):
		available_ingredients[id] = 0
		
	available_ingredients[id] += amount_to_add
	ingredients_amount_changed.emit(id)
	print(id + " added")


func remove_ingredient(id: String, amount_to_remove: int) -> void:	
	available_ingredients[id] -= amount_to_remove
	ingredients_amount_changed.emit(id)
	

func get_available_ingredient_amount(id: String) -> int:
	if not available_ingredients.has(id):
		return 0
		
	return available_ingredients[id]
	
	
func print_contents() -> void:
	print("Contents of container")
	for id in available_ingredients:
		print(id + " " + str(available_ingredients[id]))
