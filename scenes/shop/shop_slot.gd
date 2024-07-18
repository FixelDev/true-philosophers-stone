extends Node

class_name ShopSlot

var slot_node: Button
var item: Item
var item_amount: int
var is_slot_enabled = true


func _init(slot_node: Button):
	self.slot_node = slot_node
	
	slot_node.pressed.connect(_on_slot_pressed)

func set_item(item: Item, amount: int) -> void:
	self.item = item
	item_amount = amount
	
	update_slot_ui("Name: " + item.name + " Amount: " + str(item_amount) + " Price: " + str(item.price))


func update_slot_ui(text: String) -> void:
	slot_node.text = text


func get_item() -> Item:
	return item
	

func get_item_amount() -> int:
	return item_amount
	
	
func _on_slot_pressed() -> void:
	if item.price > Globals.coins:
		return
		
	Globals.coins -= item.price
	item_amount -= 1
	
	match item.get_item_type():
		Globals.ItemType.RECIPE:
			RecipesDatabase.unlock_recipe(item.id)
		Globals.ItemType.INGREDIENT:
			pass
			
	if item_amount <= 0:
		disable_slot()
	else:
		update_slot_ui("Name: " + item.name + " Amount: " + str(item_amount) + " Price: " + str(item.price))

func disable_slot() -> void:
	slot_node.disabled = true
	update_slot_ui("SOLD")
