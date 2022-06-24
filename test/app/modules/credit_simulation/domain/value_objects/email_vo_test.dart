import 'package:flutter_test/flutter_test.dart';
import 'package:rispar/app/modules/credit_simulation/domain/errors/credit_simulation_failure.dart';
import 'package:rispar/app/modules/credit_simulation/domain/value_objects/email_vo.dart';

void main() {
  EmailVO email;
  group("Test cases for EmailVO | ", () {
    test("should acess email if is valid e-mail", () {
      email = EmailVO("example@gmail.com");
      expect(email.email, "example@gmail.com");
    });
    test("should throw if is not valid format e-mail", () {
      expect(() => EmailVO("example.example"),
          throwsA(isA<UserCredentialsInvalid>()));
    });
  });
}
