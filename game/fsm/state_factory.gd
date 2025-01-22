extends Node

class_name StateFactory
var rule_follow: Rule
var rule_goto: Rule

var _states_dic: = {}
var state: State
onready var character: Character = get_parent()
onready var input_component = $InputComponent

func _ready() -> void:
	assert(input_component.connect("direction_changed", self, "_on_direction_changed") == OK,
		Globals.MSG_SIGNAL_NOT_CONNECTED)

	for c in get_children():
		if c is State:
			_states_dic[c.name] = c
			(c as State).character = character
	state = _states_dic.values()[0]
	state.enter()

func _process(delta: float) -> void:
	state.process(delta)


func change_state(new_state: String):
	if state:
		state.exit()
		state = _states_dic[new_state]
		state.enter()

func _on_velocity_changed(_v: Vector2):
	character.animation_tree.set("parameters/Idle/blend_position", character.new_direction)
	character.animation_tree.set("parameters/Walk/blend_position", character.new_direction)
	character.animation_tree["parameters/conditions/walking"] = _v.length_squared() > 0
	pass



func _on_direction_changed(direction: Vector2):
	state.input({"direction_changed": direction})
