extends State

func _ready() -> void:
	anim_name = "Idle"

func enter():
	#(_owner.get_animation_state_machine() as AnimationNodeStateMachinePlayback).travel("Idle")
	pass

func process(_delta):
	pass


func exit():
	pass
