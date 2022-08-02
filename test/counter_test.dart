import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/else/counter.dart';

void main() {
  test("카운트가 수가 증가 되어야 합니다.", () {
    final counter = Counter();

    counter.increase();

    expect(counter.value, 1);
  });
}
