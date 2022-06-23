import '../../../../core/errors/client_http_failures.dart';
import '../../../../core/errors/general_failures.dart';

class CreditSimulationNoInternetConnection extends NoInternetConection {}

class GeneralFailure implements Exception {}

class UserCredentialsInvalid extends Failure {
  @override
  final String? message;
  UserCredentialsInvalid({
    this.message,
  });
}

class LTVNotAvailable extends Failure {
  @override
  final String? message;
  LTVNotAvailable({
    this.message,
  });
}

class AmountNotAvailable extends Failure {
  @override
  final String? message;
  AmountNotAvailable({
    this.message,
  });
}

class TermNotAvailable extends Failure {
  @override
  final String? message;
  TermNotAvailable({
    this.message,
  });
}
