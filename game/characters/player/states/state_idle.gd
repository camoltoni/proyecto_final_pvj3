extends State

onready var rule_follow: Node = $RuleFollow
onready var rule_goto: Node = $RuleGoto


func enter():
	pass


func process(_delta:float):
	pass


func exit():
	pass


func input(params: Dictionary):
	check_input_rules(params)
