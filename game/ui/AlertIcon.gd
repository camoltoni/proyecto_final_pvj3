extends TextureRect

func _ready():
	yield(get_tree().create_timer(3.0),"timeout")
	$Timer.start(0)

func _on_Timer_timeout():
	if sign(randf() - 0.75)>0.0:
		$AnimationPlayer.play("shake")
	pass # Replace with function body.
