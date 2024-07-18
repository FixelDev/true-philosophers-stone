extends Button

class_name IngredientListItem

var ingredient: Ingredient


func _ready() -> void:
	IngredientsDatabase.ingredients_container.ingredients_amount_changed.connect(_on_ingredient_amount_changed)


func set_ingredient(ingredient: Ingredient) -> void:
	self.ingredient = ingredient
	
	_on_ingredient_amount_changed(ingredient.id)


func get_ingredient() -> Ingredient:
	return ingredient 
	

func _on_ingredient_amount_changed(id: String) -> void:
	var amount: int = IngredientsDatabase.ingredients_container.get_available_ingredient_amount(ingredient.id)
	
	if amount <= 0:
		queue_free()	
	
	text = ingredient.name + " x" + str(amount)


func _on_pressed():
	IngredientsDatabase.ingredients_container.remove_ingredient(ingredient.id, 1)
	
