import 'dart:async';

import 'counter_event.dart';

class CounterBloc {
  int value = 0;

  final _stateCntrl = StreamController<int>();
  final _eventCntrl = StreamController<CounterEvent>();

  Stream<int> get state => _stateCntrl.stream;
  Sink<CounterEvent> get action => _eventCntrl.sink;

  CounterBloc() {
    _eventCntrl.stream.listen((event) {
      _handleEvent(event);
    });
    _stateCntrl.add(value); // <-- add default value
  }

  void dispose() {
    _stateCntrl.close();
    _eventCntrl.close();
  }

  _handleEvent(CounterEvent action) async {
    if (action == CounterEvent.increase) {
      value++;
    }
    _stateCntrl.add(value);
  }
}