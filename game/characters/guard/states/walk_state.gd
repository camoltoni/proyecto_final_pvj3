extends State

var tiredness: int
var guard: Guard

func enter():
	guard = character as Guard
	var world_position = guard.global_position
	while world_position == guard.global_position:
		world_position = character.level.get_random_walkable_position()
	guard.state_factory.state.check_rules({"destination": world_position})
	guard.tired = false


func process(_delta: float):
	if guard.seen:
		check_rules({"seen":""})
	pass


func exit():
	pass
