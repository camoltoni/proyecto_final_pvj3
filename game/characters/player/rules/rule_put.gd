extends Rule

func check():
	if Input.is_action_just_pressed("put"):
		var _owner: Player = owner
		var areas = _owner.get_overlapping_areas()
		if areas:
			for area in areas:
				if area.is_in_group("put"):
					get_parent().to_put()
					_owner.state_factory.state.put_time = (area as PutZone).time_to_put

