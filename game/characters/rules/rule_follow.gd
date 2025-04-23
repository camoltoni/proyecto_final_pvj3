extends Rule


func check():
	var _owner = owner as Player
	var level = _owner.level
	var input_global_position: Vector2

	if Input.is_action_just_pressed("level_click"):
		input_global_position = _owner.get_global_mouse_position()

		var path_array:Array = level.get_astar_path(_owner.global_position, input_global_position)
		if path_array.size():
			_owner.path.clear()
			_owner.path = path_array.slice(1, path_array.size()-1)
		
		if _owner.path:
			_owner.state_factory.push_state("Follow")

