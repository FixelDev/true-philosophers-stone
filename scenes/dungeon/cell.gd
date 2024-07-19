extends Node

class_name Cell

enum CellType {EMPTY, ROOM}

var x_pos: int
var y_pos: int
var cell_type: CellType
var neighbors: Array[Cell]
var room_scene: Room

func _init(x: int, y: int) -> void:
	x_pos = x
	y_pos = y
	cell_type = CellType.EMPTY


func change_cell_type(new_type: CellType) -> void:
	cell_type = new_type


func assign_neighbor(neighbor: Cell) -> void:
	neighbors.append(neighbor)
