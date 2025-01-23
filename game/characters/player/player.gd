extends Character

onready var input_component = $InputComponent
onready var state_factory: StateFactory = $StateFactory

func _ready() -> void:
	assert(connect("velocity_changed", $StateFactory, "_on_velocity_changed") == OK, 
		Globals.MSG_SIGNAL_NOT_CONNECTED)

	assert(input_component.connect("direction_changed", self, "_on_direction_changed") == OK,
		Globals.MSG_SIGNAL_NOT_CONNECTED)


func _on_level_click(global_mouse_position: Vector2):
	state_factory.state.input({"level_click": global_mouse_position})

func _on_direction_changed(direction: Vector2):
	state_factory.state.input({"direction_changed": direction})

func set_path(global_mouse_position: Vector2):
	if .set_path(global_mouse_position):
		var complete_path:Array = []
		complete_path.append_array(path)
		complete_path.push_front(position)
		owner.get_node("DrawPath").set_path(complete_path)
		return true
	return false
