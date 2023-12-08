class_name IconViewport
extends Viewport

export (Texture) var icon_texture = load("res://assets/icons/policeman.png")
export (float, 0.0, 1.0) var level = 0.5
export (Vector3) var level_color = Vector3(1.0, 0.0, 0.0)

func _ready():
	$TextureRect.texture = icon_texture
	set_shader_params(level, level_color)

func set_shader_params(new_level = 0.0, new_level_color = Vector3(0.0, 0.0, 0.0)):
	$TextureRect.material.set_shader_param("level", new_level)
	$TextureRect.material.set_shader_param("level_color", new_level_color)
	
