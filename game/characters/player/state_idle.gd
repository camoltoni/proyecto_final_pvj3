extends State

func enter():
	pass

func process(_delta:float):
	pass

func exit():
	pass

func input(params: Dictionary):
	if params.has("level_click"):
		if owner.set_path(params["level_click"]):
			owner.state_factory.change_state("Follow")
	if params.has("direction_changed"):
		if owner.set_direction(params["direction_changed"]):
			owner.state_factory.change_state("GoTo")
