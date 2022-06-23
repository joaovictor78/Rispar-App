import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../../../_design_system/styles/color_palettes.dart';
import '../../../../../_design_system/utils/sizes.dart';
import '../../../../../_design_system/widgets/custom_button_widget.dart';
import '../../../domain/entities/result_simulation_entity.dart';
import '../../controllers/simulation_controller.dart';
import '../../states/simulation_states.dart';

class SimulationResultComponent extends StatelessWidget {
  SimulationResultComponent({Key? key}) : super(key: key);
  final _controller = Modular.get<SimulationController>();
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt-BR');
  final DateFormat formatData = DateFormat('dd/MM/yyyy');
  double aroundValue(double val, int places) {
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    ResultSimulationEntity simulationResult =
        (_controller.simulationStore.value as ResultSimulationState).result;
    Widget rowWithData(String title, String value) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: Container()),
                Text(
                  value,
                  style: const TextStyle(),
                  textAlign: TextAlign.right,
                )
              ],
            ),
            SizedBox(
              height: Sizes.dp12(context),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: ColorPalettes.black12,
              height: 0.9,
              width: Sizes.width(context),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Resultado da Simulação",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: Sizes.dp30(context),
            ),
            rowWithData("Valor escolhido",
                formatCurrency.format(simulationResult.netValue)),
            rowWithData("Garantia",
                "₿ ${simulationResult.collateral.toString().replaceFirst('.', ',')}"),
            rowWithData("Taxa de juros",
                '${simulationResult.interestRate.toString().replaceFirst('.', ',')}% a.m'),
            rowWithData("Percentual de garantia", '${simulationResult.ltv}%'),
            rowWithData(
                "Primeiro vencimento",
                formatData
                    .format(DateTime.parse(simulationResult.firstDueDate))),
            rowWithData("IOF", formatCurrency.format(simulationResult.iofFee)),
            rowWithData("Tarifa da plataforma",
                formatCurrency.format(simulationResult.annualRate)),
            rowWithData("Total financiado",
                formatCurrency.format(simulationResult.contractValue)),
            rowWithData("CET mensal",
                "${aroundValue(simulationResult.monthlyRate, 2)}%"),
            rowWithData(
                "CET anual", "${aroundValue(simulationResult.annualRate, 2)}%"),
            rowWithData("Cotação do BTC",
                formatCurrency.format(simulationResult.collateralUnitPrice)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButtonWidget(
          onPressed: () {
            Modular.to.pop();
          },
          enabled: true,
          title: "Nova simulação"),
    );
  }
}
