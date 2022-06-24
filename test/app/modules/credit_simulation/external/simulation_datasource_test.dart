import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar/app/core/network/custom_dio/custom_dio.dart';
import 'package:rispar/app/core/network/interfaces/i_http_client.dart';
import 'package:rispar/app/modules/credit_simulation/domain/entities/loan_datails_entity.dart';
import 'package:rispar/app/modules/credit_simulation/domain/entities/user_data_entity.dart';
import 'package:rispar/app/modules/credit_simulation/domain/errors/credit_simulation_failure.dart';
import 'package:rispar/app/modules/credit_simulation/domain/value_objects/amount_vo.dart';
import 'package:rispar/app/modules/credit_simulation/domain/value_objects/ltv_vo.dart';
import 'package:rispar/app/modules/credit_simulation/domain/value_objects/term_vo.dart';
import 'package:rispar/app/modules/credit_simulation/external/datasource/simulation_datasource.dart';

class HttpClientMock extends Mock implements CustomDio {}

void main() {
  IHttpClient _client = HttpClientMock();
  final _datasource = SimulationDataSource(_client);
  group('Simulation DataSource |', () {
    test("should return simulation result", () async {
      when(() => _client.post(any(), data: any(named: "data"))).thenAnswer(
          (_) async => Response(
              requestOptions: RequestOptions(path: ""),
              data: _jsonResult,
              statusCode: 200));

      final result = await _datasource(LoanDetailsEntity(
          user: UserDataEntity("User name", "example@example.com"),
          amount: AmountVO(1000),
          hasProtectedCollateral: false,
          ltv: LtvVO(20),
          term: TermVO(12)));
      expect(result.fullName, "User");
    });
    test("should throw error if not have internet connection", () {
      when(() => _client.post(any(), data: any(named: "data")))
          .thenAnswer((_) => throw CreditSimulationNoInternetConnection());

      expect(
          () async => await _datasource(LoanDetailsEntity(
              user: UserDataEntity("User name", "example@example.com"),
              amount: AmountVO(1000),
              hasProtectedCollateral: false,
              ltv: LtvVO(20),
              term: TermVO(12))),
          throwsA(isA<CreditSimulationNoInternetConnection>()));
    });
  });
}

Map<String, dynamic> _jsonResult = {
  "id": "5f811ecd-92c1-4371-99da-8e4e0bfd0900",
  "fullname": "User",
  "email": "example@example.com",
  "ltv": 50,
  "contract_value": 1051.532168,
  "net_value": 1000.0,
  "installment_value": 18.678273,
  "last_installment_value": 1070.210441,
  "iof_fee": 19.986203,
  "origination_fee": 31.545965,
  "term": 12,
  "collateral": 1835535,
  "collateral_in_brl": 2000.0,
  "collateral_unit_price": 108960.0,
  "first_due_date": "2022-07-10",
  "last_due_date": "2023-06-10",
  "interest_rate": 1.79,
  "monthly_rate": 2.306876,
  "annual_rate": 31.479457
};
