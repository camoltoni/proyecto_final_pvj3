extends Character
class_name Guard, "res://assets/icons/guard.svg"

var on_sight_area: = false
var seen: = false
var last_seen : = Vector2()
var boredorm_time :float = 5.0
var boredorm :float = 0.0
var player: Player

func _ready() -> void:
	state_factory.change_state("Idle")
	player = owner.find_node("Player")

func seeing():
	var see = false
	if on_sight_area:
		var space = get_world_2d().direct_space_state
		var result = space.intersect_ray(global_position, player.global_position, [self], collision_mask, true, true)
		var ray_start: Vector2 = global_position + $Sight.position
		var ray_end: Vector2 = player.global_position + $Sight.position
		if result.empty():
			result = space.intersect_ray(ray_start, ray_end, [self], collision_mask, true, true)
		see = result.has("collider") and result["collider"] is Player
	return see

func _on_Sight_area_entered(area: Area2D) -> void:
	if area is Player:
		on_sight_area = true


func _on_Sight_area_exited(area: Area2D) -> void:
	if area is Player:
		on_sight_area = false
		seen = false
