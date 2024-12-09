class_name State

extends Node
var character: Character
var rules: Array
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


func input(_params: Dictionary):
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)

func check_input_rules(params: Dictionary):
	for r in rules:
		r.check(params, character)
