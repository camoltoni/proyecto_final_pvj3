extends Node

signal change_scene

func _input(event: InputEvent) -> void:
	var emit: = false
	if event.is_action_pressed("ui_accept"):
		emit = true
	if event.is_action_pressed("ui_click"):
		emit = true
	if emit:
		emit_signal("change_scene")
