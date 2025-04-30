extends Rule

func check():
	var _owner: Guard = owner
	if _owner.seeing() and !_owner.seen:
		_owner.seen = true
		print_debug("seeing")
	
