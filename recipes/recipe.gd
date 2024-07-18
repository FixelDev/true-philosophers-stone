extends Item

class_name Recipe


@export var required_ingredients: Dictionary


func get_item_type() -> Globals.ItemType:
	return Globals.ItemType.RECIPE
