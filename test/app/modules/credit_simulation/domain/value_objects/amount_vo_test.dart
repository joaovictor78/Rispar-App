import 'package:flutter_test/flutter_test.dart';
import 'package:rispar/app/modules/credit_simulation/domain/errors/credit_simulation_failure.dart';
import 'package:rispar/app/modules/credit_simulation/domain/value_objects/amount_vo.dart';

void main() {
  AmountVO amountVO;
  group("Test cases for AmountVO | ", () {
    test(
        "should access value if value is greater than or equal to 1000 and value is less than equal to 300,000",
        () {
      amountVO = AmountVO(1000);
      expect(amountVO.amount, 1000);
    });

    test(
        "should access value if value is less than 1000 and value is greater than 300,000",
        () {
      expect(() => AmountVO(500), throwsA(isA<AmountNotAvailable>()));
    });
  });
}
