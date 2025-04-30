extends Character
class_name Player,  "res://assets/icons/max.svg"

func _ready() -> void:
	blend_positions  = ["parameters/Walk/blend_position","parameters/Idle/blend_position","parameters/Put/blend_position"]
	state_factory.change_state("Idle")


func on_put_ended():
	for a in get_overlapping_areas():
		if a.is_in_group("put"):
			(a as Area2D).queue_free()
