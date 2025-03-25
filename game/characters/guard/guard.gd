extends Character
class_name Guard

onready var state_factory: StateFactory = $StateFactory
onready var tiredness_timer: Timer = $TirednessTimer

export var boredorm_time: float = 10.0
export var min_tiredness_time: = 10.0
export var max_tiredness_time: = 30.0

var tired: = true
var boredorm: float = 0.0

var vigilance: int = 0
var on_watch: bool = false


func _on_TirednessTimer_timeout() -> void:
	print_debug("timeout")
	tired = true
