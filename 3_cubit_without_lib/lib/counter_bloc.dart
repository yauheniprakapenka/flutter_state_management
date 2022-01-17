import 'dart:async';

class CounterBloc {
  var _value = 0;

  final _stateCntrl = StreamController<int>();

  Stream<int> get state => _stateCntrl.stream;

  CounterBloc() {
    _stateCntrl.add(_value); // add default value
  }

  void dispose() {
    _stateCntrl.close();
  }

  increment() {
    _value++;
    _stateCntrl.add(_value);
  }
}
