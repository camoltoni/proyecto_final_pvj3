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

var seen: bool = false
var on_sight_area: bool = false


func _ready() -> void:
	connect("facing_changed", self, "_on_facing_changed")

func _physics_process(delta: float) -> void:
	if on_sight_area:
		var space = get_world_2d().direct_space_state
		var result = space.intersect_ray(global_position, target.global_position, [self], collision_mask, true, true)
#		if result.has("collider"):
#			if result["collider"] is Player and not seen:
#				seen = true
#				print_debug(seen)
		seen = result.has("collider") and result["collider"] is Player and not seen
		if seen:
			print_debug("seen", " ", Time.get_datetime_string_from_system())
	update()

func _on_TirednessTimer_timeout() -> void:
	tired = true


func _on_Sight_area_entered(area: Area2D) -> void:
	if area is Player:
		on_sight_area = true


func _on_Sight_area_exited(area: Area2D) -> void:
	if area is Player:
		on_sight_area = false


func _on_facing_changed():
	sight.rotation = facing.angle() - PI / 2.0


func _draw() -> void:
	draw_line(Vector2(0, 0), target.global_position - global_position, Color.magenta, 2.0)
