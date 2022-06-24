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

    Finder widgetFinder = find.byKey(const Key("description"));
    final richText0Widget = tester.element(widgetFinder).widget as RichText;

    expect(((richText0Widget.text as TextSpan).children![0] as TextSpan).text,
        'R\$ 1000');

    expect(((richText0Widget.text as TextSpan).children![2] as TextSpan).text,
        'R\$ 300.000');
  });
}
