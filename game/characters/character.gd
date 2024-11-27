class_name Character

extends Area2D

onready var state_factory: StateFactory = $StateFactory
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var level:TileMap = get_parent() as TileMap
var path:Array
var new_direction: Vector2
var _velocity: Vector2 = Vector2()
export var speed: float = 200.0


func _process(delta: float) -> void:
	state_factory.state.process(delta)
	if animation_player.has_animation(state_factory.state.name):
		animation_player.play(state_factory.state.name)

func move_to(world_position: Vector2) -> bool:
	if _velocity.length_squared() > 0.0:
		rotation = _velocity.angle()
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
		
