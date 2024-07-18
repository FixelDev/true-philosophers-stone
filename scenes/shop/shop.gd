extends Control

class_name Shop

@export var recipe_slot: Button
@export var ingredient_slots: Array[Button]

var randomized_recipe: Recipe
var randomized_ingredients: Array[Ingredient]


func _ready() -> void:	
	randomize_recipe()
	randomize_ingredients()
	show_available_products()
	
func randomize_recipe() -> void:
	while true:
		randomized_recipe = RecipesDatabase.get_random_recipe()
	
		if not RecipesDatabase.is_recipe_unlocked(randomized_recipe.id):
			break


func randomize_ingredients() -> void:
	while true:
		var ingredient: Ingredient = IngredientsDatabase.get_random_ingredient()
		
		if not is_ingredient_already_picked(ingredient.id):
			randomized_ingredients.append(ingredient)
		
		if randomized_ingredients.size() >= 3:
			break
			

func is_ingredient_already_picked(id: String) -> bool:
	for ingredient in randomized_ingredients:
		if ingredient.id == id:
			return true
			
	return false


func show_available_products() -> void:
	recipe_slot.text = "Name: " + randomized_recipe.name + " Price: " + str(randomized_recipe.price)
	
	for i in range(randomized_ingredients.size()):
		var ingredient: Ingredient = randomized_ingredients[i]
		var slot: Button = ingredient_slots[i]
		
		slot.text = "Name: " + ingredient.name + " Price: " + str(ingredient.price)


func _on_recipe_slot_pressed() -> void:
	if Globals.coins < randomized_recipe.price:
		return
		
	recipe_slot.text = "SOLD"
	recipe_slot.disabled = true
	SignalManager.recipe_bought.emit(randomized_recipe.id)
