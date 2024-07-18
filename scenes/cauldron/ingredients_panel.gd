extends Panel

@export var ingredient_list_item_scene: PackedScene

@onready var ingredients_list = %IngredientsList
@onready var ingredients_container: IngredientsContainer = %IngredientsContainer



func _ready() -> void:
	
	
	for id in IngredientsDatabase.ingredients_container.available_ingredients:
		var ingredient_list_item: IngredientListItem = ingredient_list_item_scene.instantiate()
		ingredients_list.add_child(ingredient_list_item)
		
		ingredient_list_item.set_ingredient(IngredientsDatabase.get_ingredient(id))
		
		ingredient_list_item.pressed.connect(ingredients_container.add_ingredient.bind(id, 1))

