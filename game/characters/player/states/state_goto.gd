extends State

var _target_point_world: = Vector2()

func enter():
	if character.new_direction is Vector2:
		_target_point_world = owner.new_direction

func process(_delta):
	var arrived_to_next_point = owner.move_to(_target_point_world)
	if arrived_to_next_point:
		character.state_factory.change_state("Idle")

func input(params: Dictionary):
	check_input_rules(params)

func exit():
	character.set_direction(Vector2.ZERO)
