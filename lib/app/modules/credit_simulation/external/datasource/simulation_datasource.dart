import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/errors/client_http_failures.dart';
import '../../../../core/network/interfaces/i_http_client.dart';
import '../../domain/entities/loan_datails_entity.dart';
import '../../domain/entities/result_simulation_entity.dart';
import '../../domain/errors/credit_simulation_failure.dart';
import '../../infra/interfaces/i_simulation_datasource.dart';
import '../mappers/loan_details_mapper.dart';
import '../mappers/result_simulation_mapper.dart';

class SimulationDataSource implements ISimulationDataSource {
  final IHttpClient _client;

  SimulationDataSource(this._client);
  @override
  Future<ResultSimulationEntity> call(LoanDetailsEntity loanDetails) async {
    try {
      LoanDetailsMapper mapper = LoanDetailsMapper();
      final data = mapper.toJson(loanDetails);
      final response =
          await _client.post("/acquisition/simulation", data: jsonEncode(data));
      return ResultSimulationMapper.fromJson(response.data);
    } on DioFailure catch (error) {
      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        throw CreditSimulationNoInternetConnection();
      } else if (error.type == DioErrorType.other) {
        throw CreditSimulationNoInternetConnection();
      } else {
        throw GeneralFailure();
      }
    }
  }
}
