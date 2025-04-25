extends State

signal put_ended

var put_time: float
onready var _owner: Player = owner
func enter():
	assert(connect("put_ended", _owner, "on_put_ended") == OK, Globals.MSG_SIGNAL_NOT_CONNECTED)
	_owner.get_anim_state_machine().travel("Put")


func process(delta:float):
	if put_time <= 0.0:
		emit_signal("put_ended")
		_owner.state_factory.change_state("Idle")
	put_time -= delta
	pass


func exit():
	disconnect("put_ended", _owner, "on_put_ended")
	pass

