extends Node

@export var ingredients: Array[Ingredient]

signal ingredients_amount_changed(id: String)

@export var available_ingredients: Dictionary


func get_ingredient(id: String) -> Ingredient:
	for ingredient in ingredients:
		if ingredient.id == id:
			return ingredient
	return null


func get_random_ingredient() -> Ingredient:
	return ingredients.pick_random()


func add_ingredient(id: String, amount_to_add: int) -> void:
	if not available_ingredients.has(id):
		available_ingredients[id] = 0
		
	available_ingredients[id] += amount_to_add
	ingredients_amount_changed.emit(id)
		
func remove_ingredient(id: String, amount_to_remove: int) -> void:	
	available_ingredients[id] -= amount_to_remove
	ingredients_amount_changed.emit(id)

func get_available_ingredient_amount(id: String) -> int:
	if not available_ingredients.has(id):
		return 0
		
	return available_ingredients[id]
