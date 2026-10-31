extends State

func enter():
	var guard: Guard = owner
	guard.level.get_near_walkable_position(guard.global_position, 1, 1)
	print_debug("CHECK")
	pass

func process(_delta):
	pass

func exit():
	pass
