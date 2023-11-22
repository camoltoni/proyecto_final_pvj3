extends "res://screens/BaseScreen.gd"

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		emit_signal("scene_ended")
