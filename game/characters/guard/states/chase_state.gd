extends State


func enter():
	(character.get_node("AnimationTree")["parameters/playback"] as AnimationNodeStateMachinePlayback).travel("Idle")


func process(_delta):
	var guard = character as Guard
	if guard.seen:
		check_rules({"destination" : guard.player.global_position})




func exit():
	pass
