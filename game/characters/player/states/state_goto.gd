extends State

onready var state_factory: StateFactory = get_parent()
onready var rule_follow: Node = $RuleFollow


var _target_point_world: = Vector2()

func enter():
	if character.new_direction is Vector2:
		_target_point_world = character.new_direction

func process(_delta):
	var arrived_to_next_point = character.move_to(_target_point_world)
	if arrived_to_next_point:
		get_parent().change_state("Idle")

func exit():
	pass

func input(_params: Dictionary):
	if rule_follow.check(_params, owner):
		get_parent().change_state("Follow")
=======
	_target_point_world = Vector2.ZERO
	pass
>>>>>>> movimientos_previos
