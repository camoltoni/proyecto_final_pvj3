extends Rule

func check(params: Dictionary, character:Character):
	if params.has("put"):
		var areas = params["put"]
		if areas:
			for area in areas:
				if area.is_in_group("put"):
					character.state_factory.change_state("Put")
					character.state_factory.state.put_time = (area as PutZone).time_to_put
