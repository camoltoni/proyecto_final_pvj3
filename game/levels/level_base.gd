extends Node2D

onready var walls: TileMap = $Tilemaps/Walls

func _ready() -> void:
	get_viewport().connect("size_changed", self, "_on_size_changed")
	if !OS.has_feature("mobile"):
		OS.min_window_size = Vector2(512, 300)
	print_debug(walls.map_size * walls.cell_size)

func _on_size_changed():
	
	pass

