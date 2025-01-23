extends Node

class_name StateFactory

var _states_dic: = {}
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
		state.exit()
		state = _states_dic[new_state]
		state.enter()
