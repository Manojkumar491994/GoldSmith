library calculator_utils;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  // Addition
  double add(double a, double b) => a + b;

  // Subtraction
  double subtract(double a, double b) => a - b;

  // Multiplication
  double multiply(double a, double b) => a * b;

  // Division
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Cannot divide by zero");
    }
    return a / b;
  }
}
