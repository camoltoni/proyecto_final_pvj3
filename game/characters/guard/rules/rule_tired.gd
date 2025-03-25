extends Rule


func check(params:Dictionary, character:Character):
	if params.has("tired"):
		(character as Guard).state_factory.change_state("Walk")
