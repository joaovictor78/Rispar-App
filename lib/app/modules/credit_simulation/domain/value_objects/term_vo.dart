import '../errors/credit_simulation_failure.dart';

class TermVO {
  int _term = 20;
  final List<int> _availableDeadlines = [3, 6, 9, 12];
  TermVO(int term) {
    if (_availableDeadlines.contains(term)) {
      _term = term;
    } else {
      throw LTVNotAvailable(message: "O prazo informado não está disponível");
    }
  }
  get term => _term;
}
