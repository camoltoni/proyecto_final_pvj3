extends Area2D
class_name Character

onready var level:TileMap = get_parent() as TileMap
onready var state_factory: StateFactory = $StateFactory
onready var facing: Vector2 = Vector2.DOWN
#### DEBUG
onready var drawer: = owner.get_node("DrawPath")
onready var animation_tree: AnimationTree = $AnimationTree

var blend_positions: Array
var path:Array


export var speed: float = 200.0

func move_to() -> bool:
	global_position = global_position.move_toward(path[0], get_process_delta_time() * speed)
	if global_position.distance_to(path[0]) == 0.0:
		global_position = path[0]
		return true
	return false


func get_animation_state_machine() -> AnimationNodeStateMachinePlayback:
	return animation_tree["parameters/playback"]


func set_world_position(value: Vector2):
	var blend_position: Vector2 = (value - global_position).normalized()
	set_blend_position(blend_position)


func set_blend_position(next_position: Vector2):
	var blend_position: Vector2 = (next_position - global_position).normalized()
	facing = blend_position
	for b in blend_positions:
		animation_tree[b] = blend_position
