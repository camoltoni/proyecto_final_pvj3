class_name Wipe
extends CanvasLayer

signal wipe_ended

enum SIDE {right = 1, left = -1}
# Direction of the wipe
export (SIDE) var leftright = SIDE.left
# Adds a delay for the wipe
export (float, 0.1, 1.0, 0.1) var margin = 0.1

export (Color) var to_color = Color(0.1, 0.1, 0.1, 0.0)
export (Color) var from_color = Color(0.1, 0.1, 0.1, 1.0)
var time = 0.0

func _ready():
	if leftright == SIDE.right:
		time = -margin
	else:
		time = 1.0 + margin
	$ColorRect.material.set_shader_param("leftright", leftright)
	$ColorRect.material.set_shader_param("to_color", to_color)
	$ColorRect.material.set_shader_param("from_color", from_color)
	
func _process(delta):
	if time > 1.0  + margin or time < -margin:
		emit_signal("wipe_ended")
		queue_free()
	$ColorRect.material.set_shader_param("time", time)
	time += delta * (1 if leftright == SIDE.right else -1)
