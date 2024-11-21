class_name Character

extends Area2D

var path:Array setget set_path
var _target_point_world:Vector2 = Vector2()
var _velocity: Vector2 = Vector2()
export var speed: float = 200.0
var is_moving: = false

func _process(delta: float) -> void:
	if !is_moving:
		return
	var arrived_to_next_point = _move_to(_target_point_world)
	if arrived_to_next_point:
		if path.size():
			_target_point_world = path.pop_front()
		else:
			is_moving = false

func _move_to(world_position: Vector2) -> bool:
	if _velocity.length_squared() > 0.0:
		rotation = _velocity.angle()
	global_position = global_position.move_toward(_target_point_world, get_process_delta_time() * speed)
	if global_position.distance_to(world_position) == 0.0:
		global_position = world_position
		return true
	return false


func set_path(path_array: Array):
	path = path_array.slice(1, path_array.size()-1)
	if path.size():
		_target_point_world = path.pop_front()
		is_moving = true
