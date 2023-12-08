extends CanvasLayer

signal update_police
signal update_steps
signal update_ear

onready var police = $PanelContainer/HBoxContainer/MarginContainer/HBoxContainer/MarginContainer/police
onready var steps = $PanelContainer/HBoxContainer/MarginContainer/HBoxContainer/MarginContainer2/steps
onready var ear = $PanelContainer/HBoxContainer/MarginContainer/HBoxContainer/MarginContainer3/ear

func _ready():
	assert(self.connect("update_police", police, "set_level") == OK)
	assert(self.connect("update_steps", steps, "set_level") == OK)
	assert(self.connect("update_ear", ear, "set_level") == OK)


func _on_TestTimer_timeout():
	emit_signal("update_ear", randf())

	emit_signal("update_police", randf())
	emit_signal("update_steps", randf())
	pass # Replace with function body.
