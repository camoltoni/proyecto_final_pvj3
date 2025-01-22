extends State

onready var state_factory: StateFactory = get_parent()
onready var rule_follow: Rule = $RuleFollow
onready var rule_goto: Rule = $RuleGoto
onready var input_levelclick: Node2D = $InputLevelclickComponent

func _ready() -> void:
	assert(input_levelclick.connect("level_click", self, "_on_level_click") == OK, 
		Globals.MSG_SIGNAL_NOT_CONNECTED)

func enter():
	pass


func process(_delta:float):
	pass

func input(_params: Dictionary):
	if rule_goto.check(_params, owner):
		get_parent().change_state("GoTo")


func exit():
	pass


func _on_level_click(global_mouse_position: Vector2):
	if rule_follow.check({"level_click": global_mouse_position}, owner):
		(state_factory as StateFactory).change_state("Follow")
