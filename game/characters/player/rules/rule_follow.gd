extends Rule

func check(params:Dictionary, character:Character):
	if params.has("destination"):
		if character.set_path(params["destination"]):
			character.state_factory.change_state("Follow")
