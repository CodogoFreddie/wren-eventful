class Event {

}

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
		_listeners[ev].each { |listener| listener.call(ev) }
	}
}

class Eventful is EventListener {
	construct new(){
		super.call()
	}
}
