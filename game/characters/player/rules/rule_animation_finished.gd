extends Rule

func check(params:Dictionary, character:Character):
	if params.has("animation_name"):
		if (character.animation_player as AnimationPlayer).current_animation == params["animation_name"]:
			if !character.animation_player.is_playing():
				return true
	return false
