extends Node2D

signal direction_changed(direction)
signal level_click(point)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("level_click"):
		emit_signal("level_click", get_global_mouse_position())
		return
	var direction = Vector2()
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if direction.length_squared():
		if direction.x and direction.y:
			return
		emit_signal("direction_changed", direction)
