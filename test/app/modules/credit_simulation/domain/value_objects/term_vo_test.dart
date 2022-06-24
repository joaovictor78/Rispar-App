import 'package:flutter_test/flutter_test.dart';
import 'package:rispar/app/modules/credit_simulation/domain/errors/credit_simulation_failure.dart';
import 'package:rispar/app/modules/credit_simulation/domain/value_objects/term_vo.dart';

void main() {
  TermVO term;
  group("Test cases for TermVO | ", () {
    test(
      'should return term if is [3, 6, 9, 12]',
      () {
        term = TermVO(6);
        expect(term.term, equals(6));
      },
    );
    test('should throw error if is not [3, 6, 9, 12]', () {
      expect(() => TermVO(16), throwsA(isA<TermNotAvailable>()));
    });
  });
}
