extends State
# Estado común para mover un tile

func enter():
	pass

func process(_delta):
	var _owner = owner as Player
	if _owner.move_to():
		_owner.world_position = Vector2()
		_owner.state_factory.pop_state()


func exit():
	pass
