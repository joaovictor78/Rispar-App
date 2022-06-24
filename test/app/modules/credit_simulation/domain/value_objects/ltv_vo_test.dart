import 'package:flutter_test/flutter_test.dart';
import 'package:rispar/app/modules/credit_simulation/domain/errors/credit_simulation_failure.dart';
import 'package:rispar/app/modules/credit_simulation/domain/value_objects/ltv_vo.dart';

void main() {
  LtvVO ltv;
  group("Test cases for LTVVO | ", () {
    test(
      'should return term if is [20, 35, 50]',
      () {
        ltv = LtvVO(20);
        expect(ltv.ltv, equals(20));
      },
    );
    test('should throw error if is not [20, 35, 50]', () {
      expect(() => LtvVO(0), throwsA(isA<LTVNotAvailable>()));
    });
  });
}
