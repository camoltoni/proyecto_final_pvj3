extends State


func enter():
	(character.get_node("AnimationTree")["parameters/playback"] as AnimationNodeStateMachinePlayback).travel("Idle")
	pass


func process(_delta:float):
	pass

func input(_params: Dictionary):
	if rule_goto.check(_params, owner):
		get_parent().change_state("GoTo")


func exit():
	pass


func _on_level_click(global_mouse_position: Vector2):
	if rule_follow.check({"level_click": global_mouse_position}, owner):
		(state_factory as StateFactory).change_state("Follow")
