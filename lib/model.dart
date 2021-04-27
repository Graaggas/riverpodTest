import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter {
  int _counter = 0;
  int _counter2 = 0;

//* как вариант
  // Counter()
  //     : _counter = 10,
  //       _counter2 = 10;
  //

//* либо лучше так
  Counter._(this._counter, this._counter2);
  factory Counter() {
    print("111");
    int counter = 13;
    int counter2 = 13;
    return new Counter._(counter, counter2);
  }

  void increaseCounter() {
    _counter++;
  }

  void increaseCounter2() {
    _counter2++;
  }

  int get getCounter => _counter;
  int get getCounter2 => _counter2;
}

class ValuesNotifier extends StateNotifier<Counter> {
  ValuesNotifier() : super(Counter());

  void addValue() {
    state.increaseCounter();
    state.increaseCounter2();
  }
}

final valueNotifierProvider =
    StateNotifierProvider<ValuesNotifier, Counter>((ref) {
  return ValuesNotifier();
});

class NameNofitier extends StateNotifier<String> {
  NameNofitier() : super('ss');

  void setName() {
    state = 'NAME';
  }
}

final nameNotifierProvider = StateNotifierProvider<NameNofitier, String>((ref) {
  return NameNofitier();
});
