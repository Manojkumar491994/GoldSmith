import 'package:flutter_test/flutter_test.dart';

import 'package:fita_cal/fita_cal.dart';

void main() {
  test('adds one to input values', () {
    final calculator = CalculatorFita();

    test('Addition should return the correct result', () {
      expect(calculator.add(2, 3), 5);
    });

    test('Subtraction should return the correct result', () {
      expect(calculator.subtract(5, 3), 2);
    });

    test('Multiplication should return the correct result', () {
      expect(calculator.multiply(2, 3), 6);
    });

    test('Division should return the correct result', () {
      expect(calculator.divide(6, 3), 2);
    });

    test('Division by zero should throw an error', () {
      expect(() => calculator.divide(1, 0), throwsArgumentError);
    });
  });
}
