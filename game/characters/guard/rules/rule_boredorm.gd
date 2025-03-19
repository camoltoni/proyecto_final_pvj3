extends Rule

func check(params:Dictionary, character:Character):
	if params.has("bored"):
		(character as Guard).state_factory.change_state("Walk")
		pass
