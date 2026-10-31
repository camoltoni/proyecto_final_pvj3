extends Node2D


const BASE_LINE_WIDTH = 3.0
onready var p: Character = owner.find_node("Player")

var guards: Array
var objs_dict: = {}
var objs_draw: Array

func _ready() -> void:
	guards = get_tree().get_nodes_in_group("guards")
	objs_dict[p] = [p.path, Color.red]
	for g in guards:
		objs_dict[g] = [g.path, Color.blue]


func _process(_delta: float) -> void:
	objs_draw.clear()
	for o in objs_dict.keys():
		if o.path != objs_dict[o][0]:
			objs_draw.push_back([o.path, objs_dict[o][1]])
			objs_dict[o][0] = o.path
	if objs_draw.size():
		update()


func _draw() -> void:
	# set_cell(point_start.x, point_start.y, path_start_tile)
	# set_cell(point_end.x, point_end.y, path_end_tile)
	for o in objs_draw:
		var path = o[0]
		var draw_color = o[1]
		var last_point = path[0] 
		draw_circle(last_point, BASE_LINE_WIDTH * 2.0, draw_color)
		for index in range(1, len(path)):
			var current_point = path[index]
			draw_line(last_point, current_point, draw_color, BASE_LINE_WIDTH, true)
			draw_circle(current_point, BASE_LINE_WIDTH * 2.0, draw_color)
			last_point = current_point

