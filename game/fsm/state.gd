class_name State

extends Node

var character: Character

func enter():
	assert(!is_instance_valid(self), "Instances must implement this method")

func process():
	assert(!is_instance_valid(self), "Instances must implement this method")

func exit():
	assert(!is_instance_valid(self), "Instances must implement this method")
