extends State


func enter():
	(character.get_node("AnimationTree")["parameters/playback"] as AnimationNodeStateMachinePlayback).travel("Idle")
	pass


func process(_delta:float):
	pass


func exit():
	pass

func input(params: Dictionary):
	check_rules(params)
