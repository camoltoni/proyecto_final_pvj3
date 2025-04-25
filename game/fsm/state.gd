class_name State

extends Node

var rules: Array
var anim_name: String


func _ready() -> void:
	for r in get_children():
		if r is Rule:
			rules.push_back(r)


func enter():
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)


func process(_delta: float):
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)


func exit():
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)


func check_rules():
	for r in rules:
		r.check()


func set_animation():
	(owner.get_animation_state_machine() as AnimationNodeStateMachinePlayback).travel(anim_name)
