extends Button

class_name RecipeListItem

signal recipe_selected(id: String)

var recipe: Recipe


func set_recipe(recipe: Recipe) -> void:
	self.recipe = recipe
	
	update_ui()
	
func update_ui() -> void:
	text = recipe.name


func _on_pressed():
	recipe_selected.emit(recipe.id)
