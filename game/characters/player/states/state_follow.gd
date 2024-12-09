extends State

var _target_point_world: = Vector2()

func enter():
	if owner.path.size():
		_target_point_world = owner.path.pop_front()

func process(_delta):
	var arrived_to_next_point = owner.move_to(_target_point_world)
	if arrived_to_next_point:
		if character.path.size():
			_target_point_world = owner.path.pop_front()
		else:
			character.state_factory.change_state("Idle")

func input(params: Dictionary):
	check_input_rules(params)

func exit():
	pass
