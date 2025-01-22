extends State

onready var state_factory: StateFactory = get_parent()
onready var rule_follow: Node = $RuleFollow
onready var rule_goto: Node = $RuleGoto


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
			get_parent().change_state("Idle")

func input(_params: Dictionary):
	if rule_follow.check(_params, owner):
		get_parent().change_state("Follow")
	if rule_goto.check(_params, owner):
		get_parent().change_state("GoTo")

func exit():
	pass
