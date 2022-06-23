import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../entities/loan_datails_entity.dart';
import '../entities/result_simulation_entity.dart';
import '../interfaces/i_simulation_repository.dart';

class SimulateCreditUseCase {
  final ISimulationRepository _repository;
  SimulateCreditUseCase(this._repository);
  Future<Either<Failure, ResultSimulationEntity>> call(
      LoanDetailsEntity loanDetails) async {
    return await _repository(loanDetails);
  }
}
