class Event {}

class EventListener {
  newId { 
    _id = _id + 1
    return _id
  }
  
  construct new(){
    _listeners = {}
    _id = 0
  }

  addListener(ev, fn){
    var listenerId = this.newId

    var thoseListeners = _listeners[ev] || {}
    thoseListeners[listenerId] = fn
    _listeners[ev] = thoseListeners

    return listenerId
  }

  removeListener(ev, id){
    _listeners[ev].remove(id)
  }

  dispatch(ev){
    if( !(ev is Event) ){
      Fiber.throw("Can only dispatch subclasses of Event")
    }

    for(listener in (_listeners[ev.type] || {}).values){
      listener.call(ev)
    }
  }
}
