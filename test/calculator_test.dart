import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/else/calculator.dart';

void main() {
  group('계산기 수식 테스트', () {
    Calculator cal = Calculator(firstNum: 10, secondNum: 5);

    test('더하기 계산', () {
      expect(cal.add(), 15);
    });

    test('빼기 계산', () {
      expect(cal.minus(), 5);
    });
  });
}
