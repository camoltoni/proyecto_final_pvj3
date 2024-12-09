extends Node2D


const BASE_LINE_WIDTH = 3.0
const DRAW_COLOR = Color.red


var path: Array setget set_path

func set_path(_path: Array):
	path = _path
	update()

func _draw() -> void:
	# set_cell(point_start.x, point_start.y, path_start_tile)
	# set_cell(point_end.x, point_end.y, path_end_tile)
	if path.size() > 0:
		var last_point = path[0] 
		draw_circle(last_point, BASE_LINE_WIDTH * 2.0, DRAW_COLOR)
		for index in range(1, len(path)):
			var current_point = path[index]
			draw_line(last_point, current_point, DRAW_COLOR, BASE_LINE_WIDTH, true)
			draw_circle(current_point, BASE_LINE_WIDTH * 2.0, DRAW_COLOR)
			last_point = current_point

