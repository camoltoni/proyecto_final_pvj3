extends State

func enter():
	var _owner: Character = owner
	(_owner.get_node("AnimationTree")["parameters/playback"] as AnimationNodeStateMachinePlayback).travel("Idle")


func process(delta):
	var guard: Guard = owner
	guard.boredorm += delta / guard.boredorm_time
#	if character.boredorm >= 1.0:
#		check_rules({"bored": [guard.global_position]})
#		guard.boredorm = 0.0
#		guard.tiredness_timer.start(rand_range(guard.min_tiredness_time, guard.max_tiredness_time))
#	if not guard.tired:
#		check_rules({"tired": [guard.global_position]})


func exit():
	pass
