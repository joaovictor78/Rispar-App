import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../../domain/entities/loan_datails_entity.dart';
import '../../domain/entities/result_simulation_entity.dart';
import '../../domain/interfaces/i_simulation_repository.dart';
import '../interfaces/i_simulation_datasource.dart';

class SimulationRepository implements ISimulationRepository {
  final ISimulationDataSource _dataSource;
  SimulationRepository(this._dataSource);

  @override
  Future<Either<Failure, ResultSimulationEntity>> call(
      LoanDetailsEntity loanDetails) async {
    try {
      final result = await _dataSource(loanDetails);
      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
