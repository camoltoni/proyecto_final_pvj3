extends State

func _ready() -> void:
	anim_name = "Walk"


func enter():
	var _owner: Character = owner


func process(_delta):
	var _owner = owner as Character
	if !(_owner.path.empty()) and _owner.move_to():
		_owner.path.pop_front()
	if _owner.path.empty():
		_owner.state_factory.pop_state()
	else:
		_owner.set_blend_position(_owner.path[0])


func exit():
	var _owner: Character = owner
	_owner.path.clear()
