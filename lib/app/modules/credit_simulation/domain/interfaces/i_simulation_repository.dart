import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../entities/loan_datails_entity.dart';
import '../entities/result_simulation_entity.dart';

abstract class ISimulationRepository {
  Future<Either<Failure, ResultSimulationEntity>> call(
      LoanDetailsEntity loanDetails);
}
