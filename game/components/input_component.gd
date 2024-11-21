extends Node2D

signal direction_changed
signal level_click(point)

onready var character: Character = owner as Character

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_click"):
		emit_signal("level_click", get_global_mouse_position())
	var direction = Vector2()
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if direction.length_squared():
		character.start_point = character.position
		character.next_point = character.start_point + direction * Globals.CELL_SIZE
		emit_signal("direction_changed")
