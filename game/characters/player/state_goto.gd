extends State

var _target_point_world: = Vector2()

func enter():
	if owner.new_direction is Vector2:
		_target_point_world = owner.new_direction

func process(_delta):
	var arrived_to_next_point = owner.move_to(_target_point_world)
	if arrived_to_next_point:
		owner.state_factory.change_state("Idle")

func input(params: Dictionary):
	if params.has("level_click"):
		if owner.set_path(params["level_click"]):
			owner.state_factory.change_state("Follow")

func exit():
	(owner as Player).set_direction(Vector2.ZERO)
