extends State
# Estado común para mover un tile

func enter():
	var _owner: Character = owner
	_owner.world_position = _owner.path[0] 

func process(_delta):
	var _owner: Character = owner
	if _owner.move_to():
		_owner.world_position = Vector2()
		_owner.state_factory.pop_state()


func exit():
	pass
