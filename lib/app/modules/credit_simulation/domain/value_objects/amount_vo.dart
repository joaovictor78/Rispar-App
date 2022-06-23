import '../errors/credit_simulation_failure.dart';

class AmountVO {
  double _amount = 1000;
  AmountVO(double amount) {
    if (amount < 1000 && amount > 300.000) {
      throw AmountNotAvailable(
          message:
              "O valor de emprestimo deve ser maior igual a R\$1.000 e menor igual a R\$300.000");
    }
    _amount = amount;
  }
  get amount => _amount;
}
