extends State

signal bored
export var boredorm_time: float = 3.0

func enter():
	pass


func process(delta):
	character.boredorm += delta / boredorm_time
	if (character as Guard).boredorm >= 1.0:
		emit_signal("bored")


func exit():
	pass
