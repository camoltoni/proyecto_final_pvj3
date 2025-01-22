extends Rule

func check(params:Dictionary, character:Character):
	if params.has("level_click"):
		if character.set_path(params["level_click"]):
			return true
	return false
