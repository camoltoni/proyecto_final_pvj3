extends Node

class_name StateFactory

var _states_dic: = {}
var back_state: State
var state: State
onready var character: Character = get_parent()

func _ready() -> void:
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
		var actual_state: = state
		state.exit()
		if new_state == "Back":
			state = back_state
		else:
			state = _states_dic[new_state]
		back_state = actual_state
		state.enter()
