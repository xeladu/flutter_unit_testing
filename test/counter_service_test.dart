import 'package:demo/counter_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Verify counter can be increased", () {
    // Arrange
    final _sut = CounterService();

    // Act
    _sut.inc().inc().inc();

    // Assert
    expect(_sut.counter, equals(3));
  });

  test("Verify counter can be increased if below max value", () {
    final _sut = CounterService(maxCounterValue: 2);

    _sut.inc().inc();

    expect(_sut.counter, equals(2));
  });

  test("Verify counter cannot be increased above max value", () {
    final _sut = CounterService(maxCounterValue: 0);

    _sut.inc();

    expect(_sut.counter, equals(0));
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

  test("Some matcher examples", () {
    // type check
    expect(CounterService(), isA<CounterService>());

    // null check
    expect(null, isNull);
    expect("null", isNotNull);

    // bool check
    expect(3 == 3, isTrue);
    expect(3 != 3, isFalse);

    // equality check
    expect("1", equals("1"));

    // sign check
    expect(-1, isNegative);
    expect(1, isPositive);
    expect(0, isNonNegative);
    expect(0, isNonPositive);

    // list checks
    expect([], isEmpty);
    expect([2], isNotEmpty);
  });
}
