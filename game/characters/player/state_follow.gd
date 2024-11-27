extends State

var _target_point_world: = Vector2()

func enter():
	if owner.path.size():
		_target_point_world = owner.path.pop_front()

func process(_delta):
	var arrived_to_next_point = owner.move_to(_target_point_world)
	if arrived_to_next_point:
		if owner.path.size():
			_target_point_world = owner.path.pop_front()
		else:
			owner.state_factory.change_state("Idle")

func input(params: Dictionary):
	if params.has("level_click"):
		if owner.set_path(params["level_click"]):
			owner.state_factory.change_state("Follow")

func exit():
	pass
