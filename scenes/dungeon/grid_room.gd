extends Node

class_name GridRoom

var x_pos: int
var y_pos: int
var room_scene: Room
var neighbors: Array[GridRoom]

func _init(x: int, y: int, room_scene: Room) -> void:
	x_pos = x
	y_pos = y
	self.room_scene = room_scene


func assign_neigbor(neighbor: GridRoom) -> void:
	neighbors.append(neighbor)
