extends Rule

func check(params: Dictionary, character:Character):
	if params.has("direction_changed"):
		if character.set_direction(params["direction_changed"]):
			return true
