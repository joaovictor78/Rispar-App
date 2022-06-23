import '../errors/credit_simulation_failure.dart';

class EmailVO {
  final String _email;
  EmailVO(this._email) {
    bool emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (!emailIsValid) {
      throw UserCredentialsInvalid(message: "Formato de e-mail inválido");
    }
  }
  get email => _email;
}
