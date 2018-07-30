class Event {}

class IncrementEvent is Event {
	construct new(){}
}

class DecrementEvent is Event {
	construct new(){}
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
      if( !(ev is Event) ){
        Fiber.throw("Can only dispatch subclasses of Event")
      }
		(_listeners[ev.type] || []).each { |listener| listener.call(ev) }
	}
}

class Eventful is EventListener {
	construct new(){
		super()
	}
}

var eventHandler = Eventful.new()

eventHandler.addListener(IncrementEvent) { |event| System.print("inc: %(event)") }

eventHandler.dispatch(IncrementEvent.new())
