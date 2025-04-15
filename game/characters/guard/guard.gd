extends Character
class_name Guard

onready var state_factory: StateFactory = $StateFactory
onready var tiredness_timer: Timer = $TirednessTimer
onready var target: Player = owner.find_node("Player")
onready var sight: Area2D = $Sight

export var boredorm_time: float = 10.0
export var min_tiredness_time: = 10.0
export var max_tiredness_time: = 30.0

var tired: = true
var boredorm: float = 0.0
var last_point

var seen: bool = false
var on_sight_area: bool = false
var player

func _ready() -> void:
	assert(connect("facing_changed", self, "_on_facing_changed") == OK, Globals.MSG_SIGNAL_NOT_CONNECTED)

func _physics_process(_delta: float) -> void:
	var is_seen: bool = _seeing()
	if is_seen:
		state_factory.state.check_rules({"seen" : true})
	elif not is_seen and seen:
		state_factory.state.check_rules({"checking" : true})
	seen = is_seen
	update()


func _seeing():
	var see = false
	if on_sight_area:
		var space = get_world_2d().direct_space_state
		var result = space.intersect_ray(global_position, target.global_position, [self], collision_mask, true, true)
		var ray_start: Vector2 = global_position + $Sight.position
		var ray_end: Vector2 = target.global_position + $Sight.position
		if result.empty():
			result = space.intersect_ray(ray_start, ray_end, [self], collision_mask, true, true)

		see = result.has("collider") and result["collider"] is Player
	return see


func _on_TirednessTimer_timeout() -> void:
	tired = true


func _on_Sight_area_entered(area: Area2D) -> void:
	if area is Player:
		on_sight_area = true
		player = area as Player


func _on_Sight_area_exited(area: Area2D) -> void:
	if area is Player:
		on_sight_area = false


func _on_facing_changed():
	sight.rotation = facing.angle() - PI / 2.0


func _draw() -> void:
	if on_sight_area:
		draw_line(Vector2(0, 0), target.global_position - global_position, Color.magenta, 2.0)
