class Event {}

class EventListener {
	construct new(){
		_listeners = {}
	}

	addListener(ev, fn){
		var thoseListeners = _listeners[ev] || []
		thoseListeners.add(fn)
		_listeners[ev] = thoseListeners
	}

	dispatch(ev){
      if( !(ev is Event) ){
        Fiber.throw("Can only dispatch subclasses of Event")
      }
		(_listeners[ev.type] || []).each { |listener| listener.call(ev) }
	}
}
