extends CanvasLayer


@export var ingredients_ui: Dictionary
@export var coins_ui: Label



func _ready() -> void:		
	IngredientsDatabase.ingredients_container.ingredients_amount_changed.connect(_on_ingredients_amount_changed)
	Globals.coins_amount_changed.connect(_on_coins_amount_changed)
	
	_on_coins_amount_changed()
	
	for id in ingredients_ui:
		_on_ingredients_amount_changed(id)

func _on_ingredients_amount_changed(id: String):
	get_node(ingredients_ui[id]).text = str(IngredientsDatabase.ingredients_container.get_available_ingredient_amount(id)) + "x "


func _on_coins_amount_changed():
	coins_ui.text = str(Globals.coins) + "x "


