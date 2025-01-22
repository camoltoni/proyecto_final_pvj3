extends Node2D

signal level_click(point)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("level_click"):
		emit_signal("level_click", get_global_mouse_position())
		return

