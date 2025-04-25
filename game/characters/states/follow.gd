extends State

func _ready() -> void:
	anim_name = "Walk"


func enter():
	var _owner: Character = owner
	_owner.world_position = _owner.path[0]


func process(_delta):
	var _owner = owner as Character
	if _owner.path.empty():
		_owner.state_factory.pop_state()
		return
	if _owner.move_to():
		_owner.path.pop_front()
		if _owner.path.size():
			_owner.world_position = _owner.path[0]


func exit():
	pass
