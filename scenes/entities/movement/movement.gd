extends Node2D

class_name Movement

var character_body: CharacterBody2D
var player: Player

func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]


func set_character_body(character_body: CharacterBody2D) -> void:
	self.character_body = character_body


func move() -> void:
	pass
