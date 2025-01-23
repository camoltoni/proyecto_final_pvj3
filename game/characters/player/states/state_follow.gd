extends State

onready var state_factory: StateFactory = get_parent()
onready var rule_follow: Node = $RuleFollow
onready var rule_goto: Node = $RuleGoto


var _target_point_world: = Vector2()

func enter():
	if character.path.size():
		_target_point_world = character.path.pop_front()
		character.get_anim_state_machine().travel("Walk")
		character.get_node("AnimationTree")["parameters/Walk/blend_position"] = calculate_direction(_target_point_world)
		print_debug("Walk", _target_point_world)

func process(_delta):
	var arrived_to_next_point = character.move_to(_target_point_world)
	if arrived_to_next_point:
		if character.path.size():
			_target_point_world = character.path.pop_front()
		else:
			get_parent().change_state("Idle")

func input(_params: Dictionary):
	if rule_follow.check(_params, owner):
		get_parent().change_state("Follow")
	if rule_goto.check(_params, owner):
		get_parent().change_state("GoTo")

func exit():
	pass

func calculate_direction(point: Vector2):
	return (point - character.global_position).normalized()
