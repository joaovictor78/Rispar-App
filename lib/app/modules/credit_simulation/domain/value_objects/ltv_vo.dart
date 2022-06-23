import '../errors/credit_simulation_failure.dart';

class LtvVO {
  int _ltv = 20;
  final List<int> _availableLTVValues = [20, 35, 50];
  LtvVO(int ltv) {
    if (_availableLTVValues.contains(ltv)) {
      _ltv = ltv;
    } else {
      throw LTVNotAvailable(
          message:
              "O valor do percentual de garantia informado não está disponivel");
    }
  }
  get ltv => _ltv;
}
