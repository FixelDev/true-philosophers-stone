extends Panel

class_name RecipeDetails

@onready var text_edit = $TextEdit


func display_recipe_details(id: String):
	var recipe: Recipe = RecipesDatabase.get_recipe(id)
	
	text_edit.text = recipe.name + "\n"
	
	for ingredient_id in recipe.required_ingredients:
		text_edit.text += IngredientsDatabase.get_ingredient(ingredient_id).name + " x" + str(recipe.required_ingredients[ingredient_id]) + "\n"
		
