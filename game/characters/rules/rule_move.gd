extends Rule


func check():
	var _owner = owner as Player
	var level = _owner.level
	var input_direction = Vector2()

	input_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if input_direction.length_squared():
		if input_direction.x and input_direction.y:
			return
	else:
		return
	var valid_direction = level.get_valid_direction(_owner.global_position, input_direction)
	if valid_direction:
		_owner.world_position = valid_direction
		_owner.path.clear()
		_owner.state_factory.push_state("Move")
