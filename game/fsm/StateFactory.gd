extends Node

var states_dic: = {}

onready var state_owner = owner
var state: State

func _ready() -> void:
	for c in get_children():
		if c is State:
			states_dic[c.name] = c
	state = states_dic.values()[0]
	state.enter()

func change_state(new_state: String):
	if state:
		state.exit()
		state = states_dic[new_state]
		state.enter()
