extends Control

class_name Shop

@export var shop_slot_amount: int
@export var shop_slot_node: PackedScene

@onready var shop_slots_holder = %ShopSlots


var shop_slots: Array[ShopSlot]


func _ready() -> void:	
	create_shop_slots()	
	randomize_recipe()
	randomize_ingredients()
	
func create_shop_slots():
	for i in range(shop_slot_amount):
		var slot_node: Button = shop_slot_node.instantiate()
		shop_slots_holder.add_child(slot_node)
		
		var shop_slot: ShopSlot = ShopSlot.new(slot_node)
		shop_slots.append(shop_slot)

	
func randomize_recipe() -> void:
	var randomized_recipe: Recipe
	
	if RecipesDatabase.are_all_recipes_unclocked():
		return
	
	while true:
		randomized_recipe = RecipesDatabase.get_random_recipe()
	
		if not RecipesDatabase.is_recipe_unlocked(randomized_recipe.id):
			break
			
	shop_slots[0].set_item(randomized_recipe, 1)


func randomize_ingredients() -> void:
	var i = 1
	
	while true:
		var ingredient: Ingredient = IngredientsDatabase.get_random_ingredient()
		
		if not is_ingredient_already_picked(ingredient.id):
			shop_slots[i].set_item(ingredient, randi_range(5, 10))
			i += 1
			
			
		if i >= shop_slot_amount:
			break
			

func is_ingredient_already_picked(id: String) -> bool:
	for slot in shop_slots:
		var item: Item = slot.get_item()
		
		if item == null:
			continue
		
		if item.id == id:
			return true
			
	return false

