extends Rule


func check():
	var _owner: Character = owner
	var level = _owner.level

	var input_global_position: Vector2 = Vector2()
	if Input.is_action_just_pressed("level_click"):
		input_global_position = _owner.get_global_mouse_position()
	else:
		if _owner.path.size() == 1:
			return
		var input_direction = Vector2()
		input_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		input_direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		if input_direction.length_squared():
			if input_direction.x and input_direction.y:
				return
			input_global_position = _owner.global_position + input_direction * level.cell_size
		else:
			return
	if input_global_position.length_squared():
		var path_array:Array = level.get_astar_path(_owner.global_position, input_global_position)
		if path_array.size() > 1:
			if _owner.path:
				_owner.path.clear()
			_owner.path = path_array.slice(1, path_array.size()-1)
		if _owner.path.size():
			get_parent().to_follow()
