extends Area2D
class_name Character

signal facing_changed

onready var level:TileMap = get_parent() as TileMap
onready var state_factory: StateFactory = $StateFactory
onready var facing: Vector2 = Vector2.DOWN
#### DEBUG
onready var drawer: = owner.get_node("DrawPath")

var path:Array
var world_position: Vector2


export var speed: float = 200.0

func move_to() -> bool:
	global_position = global_position.move_toward(world_position, get_process_delta_time() * speed)
	if global_position.distance_to(world_position) == 0.0:
		global_position = world_position
		return true
	return false


func get_anim_state_machine():
	return $AnimationTree["parameters/playback"]


func set_animation_direction(point: Vector2):
	facing = (point - global_position).normalized()
	emit_signal("facing_changed")
	$AnimationTree["parameters/Walk/blend_position"] = facing
	$AnimationTree["parameters/Idle/blend_position"] = facing

