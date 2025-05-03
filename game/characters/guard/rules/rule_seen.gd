extends Rule

func check():
	var _owner: Guard = owner
	if _owner.seeing() and !_owner.seen:
		_owner.seen = true
		_owner.state_factory.change_state("Chase")
		
	
