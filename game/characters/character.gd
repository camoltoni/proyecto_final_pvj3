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
var world_position: Vector2 setget set_world_position


export var speed: float = 200.0

func move_to() -> bool:
	global_position = global_position.move_toward(world_position, get_process_delta_time() * speed)
	if global_position.distance_to(world_position) == 0.0:
		global_position = world_position
		return true
	return false


func get_animation_state_machine() -> AnimationNodeStateMachinePlayback:
	return animation_tree["parameters/playback"]


func set_world_position(value: Vector2):
	world_position = value
	var blend_position: Vector2 = (world_position - global_position).normalized()
	set_blend_position(blend_position)


func set_blend_position(blend_position: Vector2):
	for b in blend_positions:
		animation_tree[b] = blend_position
