extends State


export var boredorm_time: float = 3.0

func enter():
	pass


func process(delta):
	character.boredorm += delta / boredorm_time
	if (character as Guard).boredorm >= 1.0:
		self.check_rules({"bored": [character.global_position]})
		character.boredorm = 0.0


func exit():
	pass
