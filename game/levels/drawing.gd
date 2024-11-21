extends TileMap

const DRAW_COLOR = Color.red
const BASE_LINE_WIDTH = 3.0
var _point_path:Array = [] setget set_point_path
onready var _half_cell_size: = cell_size / 2.0

func _draw():
	return
	if not _point_path.size():
		return
	print_debug("DRAWING")
	var point_start = _point_path[0]
	var point_end = _point_path[len(_point_path) - 1]

	set_cell(point_start.x, point_start.y, 0) #info_layer.tile_set.find_tile_by_name("path_start"))
	set_cell(point_end.x, point_end.y, 1) #info_layer.tile_set.find_tile_by_name("path_end"))

	var last_point = map_to_world(Vector2(point_start.x, point_start.y)) + _half_cell_size
	for index in range(1, len(_point_path)):
		var current_point = map_to_world(Vector2(_point_path[index].x, _point_path[index].y)) + _half_cell_size
		draw_line(last_point, current_point, DRAW_COLOR, BASE_LINE_WIDTH, true)
		draw_circle(current_point, BASE_LINE_WIDTH * 2.0, DRAW_COLOR)
		last_point = current_point

func set_point_path(path: Array):
	_point_path = path
	update()
