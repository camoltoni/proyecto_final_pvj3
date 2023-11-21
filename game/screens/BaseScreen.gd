extends CanvasLayer

const WIPE_COLOR = Color(0.1, 0.1, 0.1, 1.0)
const CLEAR_COLOR = Color(0.0, 0.0, 0.0, 0.0)

export (PackedScene) var Transition
var transition

func _ready():
	set_process(false)
	_set_transition(Wipe.SIDE.right, 0.4, CLEAR_COLOR, WIPE_COLOR)
	transition.connect("wipe_ended", self, "open_ended")


func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		set_process(false)
		_set_transition(Wipe.SIDE.left, 0.4, WIPE_COLOR, CLEAR_COLOR)
		yield(transition, "wipe_ended")
		Globals.scene_index += 1
		assert(get_tree().change_scene(Globals.scenes_array[Globals.scene_index]) == OK)



func _set_transition(_lr, _mgn, _tclr, _fclr):
	transition = Transition.instance() as Wipe
	transition.leftright = _lr
	transition.margin = _mgn
	transition.to_color = _tclr
	transition.from_color = _fclr
	add_child(transition)

func open_ended():
	set_process(true)

