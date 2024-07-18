extends Panel

@export var recipe_list_item_scene: PackedScene
@onready var recipes_list: VBoxContainer = %RecipesList
@onready var recipe_details: RecipeDetails = $RecipeDetails


func _ready():
	display_available_recipes()
	

func display_available_recipes() -> void:
	for id in RecipesDatabase.unlocked_recipe_ids:
		var recipe: Recipe = RecipesDatabase.get_recipe(id)
		var recipe_list_item: RecipeListItem = recipe_list_item_scene.instantiate()
		recipes_list.add_child(recipe_list_item)
		
		recipe_list_item.set_recipe(recipe)
		
		recipe_list_item.recipe_selected.connect(display_recipe_details)
		

func display_recipe_details(id: String) -> void:
	recipe_details.display_recipe_details(id)

	toggle_panels()


func _on_return_button_pressed() -> void:
	toggle_panels()
	

func toggle_panels() -> void:
	recipes_list.visible = !recipes_list.visible
	recipe_details.visible = !recipe_details.visible
