import 'package:demo/counter_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Verify counter can be increased", () {
    final _sut = CounterService();
    _sut.inc().inc().inc();

    expect(_sut.counter, equals(3));
  });

  test("Verify counter cannot be increased above max value", () {
    final _sut = CounterService(maxCounterValue: 2);
    _sut.inc().inc();
    expect(_sut.counter, equals(2));

    _sut.inc();
    expect(_sut.counter, equals(2));
  });

  test("Verify counter can be decreased", () {
    final _sut = CounterService();
    _sut.inc().inc().inc();
    expect(_sut.counter, equals(3));

    _sut.dec();
    expect(_sut.counter, equals(2));
  });

  test("Verify counter cannot be decreased below zero", () {
    final _sut = CounterService();

    _sut.dec();
    expect(_sut.counter, equals(0));
  });

  test("Verify counter can be increased asynchronously", () async {
    final _sut = CounterService();
    await _sut.incAsync()
      ..incAsync()
      ..incAsync();

    expect(_sut.counter, equals(3));
  });

  /*test("Verify counter can be increased asynchronously", () async {
    final _sut = CounterService();
    await _sut.incAsync()
      ..incAsync()
      ..incAsync();

    expect(_sut, isA<CounterService>());
    expect(_sut.maxCounterValue, isNull);
    expect(_sut.counter == 3, isTrue);
  });*/
}
