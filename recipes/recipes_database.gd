extends Node

@export var recipes: Array[Recipe]

@export var unlocked_recipe_ids: Array[String]


func _ready() -> void:
	SignalManager.recipe_bought.connect(_on_recipe_bought)


func get_recipe(id: String) -> Recipe:
	for recipe in recipes:
		if recipe.id == id:
			return recipe
			
	return null


func get_random_recipe() -> Recipe:
	return recipes.pick_random()


func is_recipe_unlocked(id: String) -> bool:
	return unlocked_recipe_ids.has(id)


func unlock_recipe(id: String) -> void:
	unlocked_recipe_ids.append(id)
	print("Recipe " + id + " was unlocked")
	
	
func _on_recipe_bought(id: String):
	unlock_recipe(id)


func are_all_recipes_unclocked() -> bool:
	return unlocked_recipe_ids.size() == recipes.size()
