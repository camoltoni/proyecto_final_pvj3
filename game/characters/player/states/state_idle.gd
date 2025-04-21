extends State

onready var _owner:Character = owner

func enter():
	(_owner.get_node("AnimationTree")["parameters/playback"] as AnimationNodeStateMachinePlayback).travel("Idle")
	pass


func process(_delta:float):
	pass


func exit():
	pass

