extends State

var _target_point_world: = Vector2()

func enter():
	if character.new_direction is Vector2:
		_target_point_world = character.new_direction
		character.get_anim_state_machine().travel("Walk")
		character.set_animation_direction(_target_point_world)

func process(_delta):
	var arrived_to_next_point = character.move_to(_target_point_world)
	if arrived_to_next_point:
		character.state_factory.change_state("Idle")

func input(params: Dictionary):
	check_input_rules(params)

func exit():
	_target_point_world = Vector2.ZERO
	pass
