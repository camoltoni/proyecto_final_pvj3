extends Character
class_name Player


onready var input_component = $InputComponent


func _ready() -> void:
	assert(input_component.connect("level_click", self, "_on_level_click") == OK, 
		Globals.MSG_SIGNAL_NOT_CONNECTED)
	assert(input_component.connect("direction_changed", self, "_on_direction_changed") == OK,
		Globals.MSG_SIGNAL_NOT_CONNECTED)


func _on_level_click(global_mouse_position: Vector2):
	state_factory.state.input({"level_click": global_mouse_position})

func _on_direction_changed(direction: Vector2):
	state_factory.state.input({"direction_changed": direction})
