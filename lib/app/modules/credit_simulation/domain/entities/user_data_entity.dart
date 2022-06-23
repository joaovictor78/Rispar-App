import '../errors/credit_simulation_failure.dart';
import '../value_objects/email_vo.dart';

class UserDataEntity {
  late String _fullName;
  late EmailVO _email;
  UserDataEntity(String fullName, String email) {
    if (fullName.isEmpty) {
      throw UserCredentialsInvalid(message: "O nome não pode ser nulo.");
    }
    _fullName = fullName;
    _email = EmailVO(email);
  }
  get fullName => _fullName;
  get email => _email.email;
}
