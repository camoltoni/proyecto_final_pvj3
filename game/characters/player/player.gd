extends Character

func _ready() -> void:
	assert(connect("velocity_changed", $StateFactory, "_on_velocity_changed") == OK, 
		Globals.MSG_SIGNAL_NOT_CONNECTED)

func set_path(global_mouse_position: Vector2):
	if .set_path(global_mouse_position):
		var complete_path:Array = []
		complete_path.append_array(path)
		complete_path.push_front(position)
		owner.get_node("DrawPath").set_path(complete_path)
		return true
	return false
