class ResultSimulationEntity {
  String id;
  String fullName;
  String email;
  int ltv;
  double contractValue;
  double netValue;
  double installmentValue;
  double lastInstallmentValue;
  double iofFee;
  double originationFree;
  int term;
  double collateral;
  double collateralInBRL;
  double collateralUnitPrice;
  String firstDueDate;
  String lastDueDate;
  double interestRate;
  double monthlyRate;
  double annualRate;
  ResultSimulationEntity(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.ltv,
      required this.contractValue,
      required this.netValue,
      required this.installmentValue,
      required this.lastInstallmentValue,
      required this.iofFee,
      required this.originationFree,
      required this.term,
      required this.collateral,
      required this.collateralInBRL,
      required this.collateralUnitPrice,
      required this.firstDueDate,
      required this.lastDueDate,
      required this.interestRate,
      required this.monthlyRate,
      required this.annualRate}) {
    _convertSatsInBitcoins();
  }

  void _convertSatsInBitcoins() {
    collateral = collateral / 100000000;
  }
}
