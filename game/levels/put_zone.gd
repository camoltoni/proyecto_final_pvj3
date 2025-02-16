tool
extends Area2D

class_name PutZone

export var time_to_put: float = 2.0
export var ItemScene: PackedScene

func _ready() -> void:
	assert(ItemScene != null, Globals.MSG_EXPORT_VAR_SETTING)

func _exit_tree() -> void:
	assert(ItemScene, !null)
	var item: Sprite = ItemScene.instance()
	owner.call_deferred("add_child", item)
	item.global_position = global_position
	var tween: = get_tree().current_scene.create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.tween_property(item, "modulate:a", 1.0, 0.5).from(0.0)

func _create_item():
	pass
