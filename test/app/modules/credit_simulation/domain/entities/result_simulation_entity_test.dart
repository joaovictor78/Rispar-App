import 'package:flutter_test/flutter_test.dart';
import 'package:rispar/app/modules/credit_simulation/domain/entities/result_simulation_entity.dart';

void main() {
  ResultSimulationEntity _resultSimulation;
  test("should check conversion of sats to bitcoins", () {
    _resultSimulation = ResultSimulationEntity(
        id: "FFFFFFFFFFF",
        fullName: "User",
        email: "example@example.com",
        ltv: 50,
        contractValue: 1051.532168,
        netValue: 1000.0,
        installmentValue: 18.678273,
        lastInstallmentValue: 1070.210441,
        iofFee: 19.986203,
        originationFree: 31.545965,
        term: 12,
        collateral: 1835535,
        collateralInBRL: 2000.0,
        collateralUnitPrice: 108960.0,
        firstDueDate: "2022-07-10",
        lastDueDate: "2023-06-10",
        interestRate: 1.79,
        monthlyRate: 2.306876,
        annualRate: 31.479457);
    expect(_resultSimulation.collateral, equals(0.01835535));
  });
}
