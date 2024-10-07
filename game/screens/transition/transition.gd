extends ColorRect

signal transition_ended

onready var timer: Timer = $Timer

export(float, 0.1, 1.0, 0.1) var wait_for_shader: float = 0.2
export(float, 1.0, 10.0, 0.5) var duration: float = 2.0
export(ShaderMaterial) var shader_material

func _ready() -> void:
	timer.start(duration + wait_for_shader * 2.0)
	material = shader_material
	var os_time: float = Time.get_ticks_msec() / 1000.0 + wait_for_shader;
	(material as ShaderMaterial).set_shader_param("duration", duration)
	(material as ShaderMaterial).set_shader_param("os_time", os_time)

func _on_Timer_timeout() -> void:
	emit_signal("transition_ended")
	queue_free()
