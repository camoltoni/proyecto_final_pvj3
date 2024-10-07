extends Control

onready var next_screen_component: Node = $NextScreenComponent
onready var end_transition: InstancePlaceholder = $EndTransition

func _ready() -> void:
	assert(next_screen_component.connect("change_scene", self, "_on_change_scene") == OK)

func _on_change_scene():
	var t = (end_transition as InstancePlaceholder).create_instance(true)
	yield(t, "transition_ended")
	assert(get_tree().change_scene("res://screens/GameScreen.tscn") == OK)


func _on_Timer_timeout() -> void:
	_on_change_scene()
	pass
