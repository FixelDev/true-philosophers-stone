extends Resource

class_name Item

@export var id: String = ""
@export var name: String = ""
@export var price: int = 0


func get_item_type() -> Globals.ItemType:
	return Globals.ItemType.RECIPE
