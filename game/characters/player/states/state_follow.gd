extends State

var _target_point_world: = Vector2()

func enter():
	if character.path.size():
		_target_point_world = character.path.pop_front()
		character.get_anim_state_machine().travel("Walk")
		character.set_animation_direction(_target_point_world)


func process(_delta):
	var arrived_to_next_point = character.move_to(_target_point_world)
	if arrived_to_next_point:
		if character.path.size():
			_target_point_world = character.path.pop_front()
			character.set_animation_direction(_target_point_world)
		else:
			character.state_factory.change_state("Idle")


func input(params: Dictionary):
	check_input_rules(params)


func exit():
	pass


func set_animation_direction():
	var blend_position: = (_target_point_world - character.global_position).normalized()
	character.get_node("AnimationTree")["parameters/Walk/blend_position"] = blend_position
	character.get_node("AnimationTree")["parameters/Idle/blend_position"] = blend_position
