extends Character

class_name Player

onready var input_component = $InputComponent
onready var state_factory: StateFactory = $StateFactory
# SOLO PARA DEBUG
# onready var drawer: = owner.get_node("DrawPath")

func _ready() -> void:
	assert(input_component.connect("level_click", self, "_on_level_click") == OK, 
		Globals.MSG_SIGNAL_NOT_CONNECTED)
	assert(input_component.connect("direction_changed", self, "_on_direction_changed") == OK,
		Globals.MSG_SIGNAL_NOT_CONNECTED)
	assert(input_component.connect("put_object", self, "_on_put_object") == OK,
		Globals.MSG_SIGNAL_NOT_CONNECTED)


func _on_level_click(global_mouse_position: Vector2):
	#state_factory.state.input({"level_click": global_mouse_position})
	state_factory.state.check_rules({"destination": global_mouse_position})

func _on_direction_changed(direction: Vector2):
	#state_factory.state.input({"direction_changed": direction})
	state_factory.state.check_rules({"direction_changed": direction})
	
func _on_put_object():
	#state_factory.state.input({"put":get_overlapping_areas()})
	state_factory.state.check_rules({"put":get_overlapping_areas()})

func set_animation_direction(point: Vector2):
	var blend_position: = (point - global_position).normalized()
	$AnimationTree["parameters/Put/blend_position"] = blend_position
	.set_animation_direction(point)

#func _set_path(global_mouse_position: Vector2):
#	if .set_path(global_mouse_position):
#		var complete_path:Array = []
#		complete_path.append_array(path)
#		complete_path.push_front(position)
#		#owner.get_node("DrawPath").set_path(complete_path)
#		#drawer.set_path(complete_path)
#		return true
#	return false

func on_put_ended():
	for a in get_overlapping_areas():
		if a.is_in_group("put"):
			(a as Area2D).queue_free()
