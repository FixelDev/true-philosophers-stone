extends Item

class_name Recipe


@export var required_ingredients: Dictionary


func get_item_type() -> Globals.ItemType:
	return Globals.ItemType.RECIPE
	

func does_ingredient_exist(id: String) -> bool:
	return required_ingredients.has(id)
	
func get_ingredient_amount(id: String) -> int:
	return required_ingredients[id]

