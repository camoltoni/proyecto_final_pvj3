extends State

signal put_ended

var put_time: float

func enter():
	connect("put_ended", character, "on_put_ended")
	character.get_anim_state_machine().travel("Put")


func process(delta:float):
	if put_time <= 0.0:
		emit_signal("put_ended")
		character.state_factory.change_state("Idle")
	put_time -= delta
	pass


func exit():
	disconnect("put_ended", character, "on_put_ended")
	pass


func input(params: Dictionary):
	check_rules(params)
