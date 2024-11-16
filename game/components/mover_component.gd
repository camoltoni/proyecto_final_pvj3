extends Node

onready var character: Character = owner as Character

func _process(delta: float) -> void:
	var direction = Vector2()
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if direction.length_squared():
		owner.next_point = owner.position + direction * Globals.CELL_SIZE
