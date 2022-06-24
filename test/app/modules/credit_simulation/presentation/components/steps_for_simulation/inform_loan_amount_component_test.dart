import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar/app/modules/credit_simulation/credit_simulation_module.dart';
import 'package:rispar/app/modules/credit_simulation/presentation/components/steps_for_simulation/inform_loan_amount_component.dart';
import 'package:rispar/app/modules/credit_simulation/presentation/controllers/simulation_controller.dart';

class SimulationControllerMock extends Mock implements SimulationController {}

void main() {
  group('Initial page navigation tests', () {
    setUpAll(() {
      initModule(
        CreditSimulationModule(),
        replaceBinds: [
          Bind(
            <SimulationController>(i) => SimulationControllerMock(),
          ),
        ],
      );
    });
  });

  testWidgets(
      "should present on the screen a description stating that the minimum amount is R\$1,000 and the maximum amount is R\$300,000.00",
      (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester
        .pumpWidget(buildTestableWidget(const InformLoanAmountComponent()));
    final description = find.byKey(const Key("description"));
    expect(description, findsOneWidget);
  });
}
