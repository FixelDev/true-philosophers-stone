extends Node2D

class_name Room

@export var exit_hatch: ExitHatch
@export var enemy_scene: PackedScene

@onready var room_spawn_points_holder = %RoomSpawnPointsHolder
@onready var enemy_spawn_points_holder = %EnemySpawnPointsHolder

enum RoomType {NORMAL_ROOM, DANGER_ROOM, TREASURE_ROOM}

var is_positioned: bool = false
var room_type: RoomType = RoomType.NORMAL_ROOM
var enabled_room_doors: Array[RoomDoor]
var enemies_in_room:int
var cleared: bool = true
var is_exit_room: bool = false

func change_position(new_pos: Vector2) -> void:
	global_position = new_pos
	is_positioned = true


func get_room_spawn_point_position(direction_id: String) -> Vector2:
	return get_node("RoomSpawnPointsHolder/" + direction_id).global_position
	

func enable_door(direction_id: String) -> void:
	for door in %DoorsHolder.get_children():
		if door.corresponding_neighbor_dir == direction_id:
			door.enable()
			enabled_room_doors.append(door)

func get_player_spawn_position(direction_id: String) -> Vector2:
	for door in %DoorsHolder.get_children():
		if door.corresponding_neighbor_dir == direction_id:
			return door.get_player_spawn_point()
			
	return Vector2.ZERO


func set_as_exit_room() -> void:
	is_exit_room = true


func enable_exit_hatch() -> void:
	if cleared and is_exit_room:
		exit_hatch.enable()


func change_room_type(new_room_type: RoomType) -> void:
	room_type = new_room_type
	
	if room_type == RoomType.DANGER_ROOM:
		cleared = false


func _on_player_entered_door(direction_id: String) -> void:
	pass


func on_player_entered_room() -> void:
	if room_type == RoomType.DANGER_ROOM and not cleared:
		toggle_doors(false)
		spawn_enemies()
	elif room_type == RoomType.TREASURE_ROOM:
		print("There is a chest")
	else:
		print("Empty room")
	
	enable_exit_hatch()

func spawn_enemies() -> void:
	enemies_in_room = randi_range(1, 2)
	
	for i in range(enemies_in_room):
		var enemy: Enemy = enemy_scene.instantiate()
		enemy.get_node("HealthManager").died.connect(_on_enemy_died)
		get_tree().root.call_deferred("add_child", enemy)
		enemy.global_position = enemy_spawn_points_holder.get_children().pick_random().global_position
		
		
func toggle_doors(opened: bool) -> void:
	for door in enabled_room_doors:
		door.is_opened = opened


func _on_enemy_died() -> void:
	enemies_in_room -= 1
	
	if enemies_in_room <= 0:
		toggle_doors(true)
		cleared = true
		enable_exit_hatch()
