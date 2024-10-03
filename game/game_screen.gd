extends Control

func _ready() -> void:
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://TitleScreen.tscn")
	
