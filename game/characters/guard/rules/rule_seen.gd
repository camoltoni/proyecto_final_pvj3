extends Rule

func check(params:Dictionary, character:Character):
	var guard: = character as Guard
	if params.has("seen"):
		guard.state_factory.change_state("Chase")
