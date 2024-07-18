extends Area2D

@onready var ingredients_container: IngredientsContainer = %IngredientsContainer


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and ingredients_container.available_ingredients.size() > 0:
		craft_spell()
		

func craft_spell() -> void:
	
	var crafted_spell_id = ""
	
	
	for recipe_id in RecipesDatabase.unlocked_recipe_ids:
		var current_recipe: Recipe = RecipesDatabase.get_recipe(recipe_id)
		var success: bool = true
		
		for ingredient_id in ingredients_container.available_ingredients:
			if not current_recipe.does_ingredient_exist(ingredient_id):
				success = false
				break
			elif current_recipe.get_ingredient_amount(ingredient_id) != ingredients_container.get_available_ingredient_amount(ingredient_id):
				success = false
				break
				
		if success:
			crafted_spell_id = current_recipe.id
			break
			
	print("Crafted" + crafted_spell_id)
	SpellDatabase.add_new_spell(crafted_spell_id)
	ingredients_container.available_ingredients.clear()

