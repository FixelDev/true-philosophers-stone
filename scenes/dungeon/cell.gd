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


func change_room_type(new_type: Room.RoomType) -> void:
	room_scene.change_room_type(new_type)


func assign_neighbor(neighbor: Cell) -> void:
	neighbors.append(neighbor)


func set_as_exit_room() -> void:
	room_scene.enable_exit_hatch()


func on_player_entered() -> void:
	room_scene.on_player_entered_room()
