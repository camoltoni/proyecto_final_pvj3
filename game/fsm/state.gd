class_name State

extends Node

func enter():
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)


func process(_delta: float):
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)


func exit():
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)


func input(_params: Dictionary):
	assert(!is_instance_valid(self), Globals.MSG_INSTANCE_IMPLEMENT_METHOD)
