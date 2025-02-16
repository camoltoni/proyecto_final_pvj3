extends Area2D
class_name Character

onready var level:TileMap = get_parent() as TileMap

var path:Array
var new_direction: Vector2

export var speed: float = 200.0

func move_to(world_position: Vector2) -> bool:
	global_position = global_position.move_toward(world_position, get_process_delta_time() * speed)
	if global_position.distance_to(world_position) == 0.0:
		global_position = world_position
		return true
	return false

func set_path(global_mouse_position: Vector2):
	var path_array:Array = level.get_astar_path(global_position, global_mouse_position)
	if path_array.size():
		path = path_array.slice(1, path_array.size()-1)
		return true

func set_direction(input_direction: Vector2):
	if input_direction.length_squared() == 0.0:
		return
	var valid_direction = level.get_valid_direction(global_position, input_direction)
	if valid_direction:
		new_direction = valid_direction
		return true

func get_anim_state_machine():
	return $AnimationTree["parameters/playback"]

func set_animation_direction(point: Vector2):
	var blend_position: = (point - global_position).normalized()
	$AnimationTree["parameters/Walk/blend_position"] = blend_position
	$AnimationTree["parameters/Idle/blend_position"] = blend_position
	$AnimationTree["parameters/Put/blend_position"] = blend_position
