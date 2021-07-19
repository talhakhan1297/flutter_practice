import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_testing/counter.dart';

void main() {
  test("Counter value should be incremented", () {
    final Counter counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });

  test("Counter value should be decremented", () {
    final Counter counter = Counter();

    counter.decrement();

    expect(counter.value, -1);
  });

  group("Counter:", () {
    test("Value should start at 0", () {
      expect(Counter().value, 0);
    });

    test("Counter value should increment", () {
      final Counter counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test("Counter value should decrement", () {
      final Counter counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
