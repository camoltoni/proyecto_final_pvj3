extends Control

onready var next_screen_component: Node = $NextScreenComponent
onready var end_transition: InstancePlaceholder = $EndTransition
onready var timer: Timer = $Timer


func _ready() -> void:
	assert(next_screen_component.connect("change_scene", self, "_on_change_scene", [], CONNECT_ONESHOT) == OK, Globals.MSG_SIGNAL_NOT_CONNECTED)


func _on_change_scene():
	if is_instance_valid(end_transition):
		var end_transition_instance = (end_transition as InstancePlaceholder).create_instance(true)
		assert(end_transition_instance.connect("transition_ended", self, "_change_scene") == OK, 
			Globals.MSG_SIGNAL_NOT_CONNECTED)


func _change_scene():
	assert(get_tree().change_scene("res://screens/game_screen.tscn") == OK)


func _on_Timer_timeout() -> void:
	_on_change_scene()
