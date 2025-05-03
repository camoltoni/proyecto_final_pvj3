extends Node
class_name StateFactory

var _states_dic: = {}

var state: State
var states_stack: = []


func _ready() -> void:
	for c in get_children():
		if c is State:
			_states_dic[c.name] = c
#	state = _states_dic.values()[0]
#	states_stack.push_front(state)
#	state.enter()


func _process(delta: float) -> void:
	state.check_rules()
	#for s in states_stack:
	#	(s as State).process(delta)
	state.process(delta)


func change_state(new_state: String):
	#if not state:
	#	return
	if state:
		state.exit()
	states_stack.clear()
	self.push_state(new_state)
#	states_stack.push_front(_states_dic[new_state])
#	state = states_stack[0]
#	state.enter()


func push_state(new_state: String):
	states_stack.push_front(_states_dic[new_state])
	state = states_stack[0]
	state.enter()
	state.set_animation()


func pop_state():
	states_stack.pop_front()
	assert(!states_stack.empty(), "No existe estado previo.")
	state.exit()
	state = states_stack[0]
	state.set_animation()
