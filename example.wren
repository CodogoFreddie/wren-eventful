import "./module" for Event, EventListener

class IncrementEvent is Event {
  construct new(){ }
}

class DecrementEvent is Event {
  construct new(){ }
}

class MultiplyEvent is Event{ 
  value { _value }
  construct new(value){
    _value = value
  }
}

class Counter is EventListener {
  value { _value }

  construct new(initialValue){
    super()

    _value = initialValue

    this.addListener(IncrementEvent) { |event| _value = _value + 1 }
    this.addListener(DecrementEvent) { |event| _value = _value - 1 }
    this.addListener(MultiplyEvent)  { |event| _value = _value * event.value }
  }
}

var counter = Counter.new(0)
counter.dispatch(IncrementEvent.new())
counter.dispatch(IncrementEvent.new())
counter.dispatch(IncrementEvent.new())
counter.dispatch(DecrementEvent.new())
System.print(counter.value)
counter.dispatch(MultiplyEvent.new(2))
System.print(counter.value)
counter.dispatch(MultiplyEvent.new(2))
