extends Node
class_name StateFactory

var _states_dic: = {}

var state: State
var states_stack: = []


func _ready() -> void:
	for c in get_children():
		if c is State:
			_states_dic[c.name] = c
	state = _states_dic.values()[0]
	states_stack.push_front(state)
	state.enter()


func _process(delta: float) -> void:
	state.check_rules()
	state.process(delta)


func change_state(new_state: String):
	if not state:
		return
	state.exit()
	states_stack.clear()
	states_stack.push_front(_states_dic[new_state])
	state = states_stack[0]
	state.enter()


func push_state(new_state: String):
	if not state:
		return
	states_stack.push_front(_states_dic[new_state])
	state = states_stack[0]
	state.enter()


func pop_state():
	if not state:
		return
	states_stack.pop_front()
	assert(!states_stack.empty(), "No existe estado previo.")
	state.exit()
	state = states_stack[0]
