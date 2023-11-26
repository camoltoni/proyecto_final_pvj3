extends "res://screens/BaseScreen.gd"

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		end_scene()
