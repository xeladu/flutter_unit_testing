class CounterService {
  int _counter = 0;
  int get counter => _counter;

  final int? maxCounterValue;

  CounterService({this.maxCounterValue});

  /// Increases the counter value if [maxCounterValue] has not been reached yet.
  CounterService inc() {
    if (maxCounterValue == null || _counter < maxCounterValue!) _counter++;

    return this;
  }

  /// Decreases the counter value if [counter] is bigger than zero.
  CounterService dec() {
    if (_counter > 0) _counter--;

    return this;
  }
}
