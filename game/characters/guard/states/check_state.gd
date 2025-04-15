extends State

func enter():
	(character.get_node("AnimationTree")["parameters/playback"] as AnimationNodeStateMachinePlayback).travel("Walk")
	check_rules({"destination" : (character as Guard).last_point})


func process(_delta):
	pass




func exit():
	pass
