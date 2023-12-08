extends TextureRect

export (PackedScene) var Viewport_scn
onready var icon_view:Viewport = Viewport_scn.instance()
onready var level := 0.5
export (Color, RGB) var level_color = Color.white

func _ready():
	assert(texture != null, "Texture must be set in editor")
	icon_view.icon_texture = texture
	get_parent().call_deferred("add_child", icon_view)
	var viewport_texture = icon_view.get_texture()
	texture = viewport_texture
	call_deferred("set_icon_shader_params")

func set_icon_shader_params():
	icon_view.call_deferred("set_shader_params", 1.0 - level, Vector3(level_color.r, level_color.g, level_color.b))
	

func set_level(level_:float = 0.0):
	level = level_
	call_deferred("set_icon_shader_params")

func set_level_color(level_color_:Color):
	level_color = level_color_
	call_deferred("set_icon_shader_params")
