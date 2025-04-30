extends State

signal put_ended
var put_time: float


func _ready() -> void:
	anim_name = "Put"


func enter():
	assert(connect("put_ended", owner, "on_put_ended") == OK, Globals.MSG_SIGNAL_NOT_CONNECTED)


func process(delta:float):
	if put_time <= 0.0:
		emit_signal("put_ended")
		var _owner: Player = owner
		_owner.state_factory.pop_state()
	put_time -= delta
	pass


func exit():
	disconnect("put_ended", owner, "on_put_ended")
	pass


func to_follow():
	var _owner: Character = owner
	_owner.state_factory.pop_state()
	_owner.state_factory.push_state("Follow")
