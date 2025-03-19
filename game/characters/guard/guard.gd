extends Character
class_name Guard

onready var state_factory: StateFactory = $StateFactory

export var min_walk_cells: = 10
export var max_walk_cells: = 30

var boredorm: float = 0.0

var vigilance: int = 0
var on_watch: bool = false


func _ready():
	# assert(connect("bored", self, "_on_bored") == OK, Globals.MSG_SIGNAL_NOT_CONNECTED)
	pass


func on_bored():
	print_debug("BORED")
	pass
