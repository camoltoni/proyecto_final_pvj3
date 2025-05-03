extends State

var tiredness: int
var guard: Guard

func enter():
	guard = owner as Guard
	var world_position = guard.global_position
	while world_position == guard.global_position:
		world_position = guard.level.get_random_walkable_position()
	guard.tired = false


func process(_delta: float):
	pass


func exit():
	pass
