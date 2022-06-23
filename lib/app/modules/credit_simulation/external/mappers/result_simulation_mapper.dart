import '../../domain/entities/result_simulation_entity.dart';

class ResultSimulationMapper {
  static ResultSimulationEntity fromJson(Map<String, dynamic> json) {
    return ResultSimulationEntity(
        id: json["id"],
        fullName: json["fullname"],
        email: json["email"],
        ltv: json["ltv"],
        contractValue: json["contract_value"],
        netValue: json["net_value"],
        installmentValue: json["installment_value"],
        lastInstallmentValue: json["last_installment_value"],
        iofFee: json["iof_fee"],
        originationFree: json["origination_fee"],
        term: json["term"],
        collateral: (json["collateral"] as int).toDouble(),
        collateralInBRL: json["collateral_in_brl"],
        collateralUnitPrice: json["collateral_unit_price"],
        firstDueDate: json["first_due_date"],
        lastDueDate: json["last_due_date"],
        interestRate: json["interest_rate"],
        monthlyRate: json["monthly_rate"],
        annualRate: json["annual_rate"]);
  }
}
