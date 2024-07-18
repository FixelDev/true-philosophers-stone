extends Node

@export var ingredients: Array[Ingredient]
@onready var ingredients_container: IngredientsContainer = $IngredientsContainer


func get_ingredient(id: String) -> Ingredient:
	for ingredient in ingredients:
		if ingredient.id == id:
			return ingredient
	return null


func get_random_ingredient() -> Ingredient:
	return ingredients.pick_random()

