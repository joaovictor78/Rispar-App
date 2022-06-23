import '../../domain/entities/loan_datails_entity.dart';
import '../../domain/entities/result_simulation_entity.dart';

abstract class ISimulationDataSource {
  Future<ResultSimulationEntity> call(LoanDetailsEntity loanDetails);
}
