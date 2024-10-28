extends Control

func _ready() -> void:
	yield(get_tree().create_timer(3.0), "timeout")
	assert(get_tree().change_scene("res://screens/TitleScreen.tscn")==OK)
	
