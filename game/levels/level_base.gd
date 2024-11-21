extends Node2D

onready var input_component: Node2D = $InputComponent
onready var obstacles: TileMap = $Tilemaps/Walls
onready var character: Area2D = $Tilemaps/Character


func _ready() -> void:
	input_component.connect("level_click", self, "_on_level_clicked")

func _on_level_clicked(point):
	character.set_path(obstacles.get_astar_path(character.global_position, point))
