extends Rule

func check():
	var guard: Guard = owner
	if guard.seen and !guard.seeing():
		guard.seen = false
		guard.last_seen = Globals.INVALID_POSITION
		guard.state_factory.pop_state()
