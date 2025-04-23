extends Node2D

signal direction_changed(direction)
signal level_click(point)
signal put_object


func _process(_delta: float) -> void:
	var _owner: Player = owner
	if Input.is_action_just_pressed("level_click"):
		emit_signal("level_click", get_global_mouse_position())
		return
	var direction = Vector2()
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if direction.length_squared():
		if direction.x and direction.y:
			return
		var valid_direction = _owner.level.get_valid_direction(owner.global_position, direction)
		if valid_direction:
			emit_signal("direction_changed", direction)
	if Input.is_action_just_pressed("put"):
		emit_signal("put_object")
