import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rispar/app/_design_system/utils/sizes.dart';

class LoadingSimulationComponent extends StatefulWidget {
  const LoadingSimulationComponent({Key? key}) : super(key: key);

  @override
  State<LoadingSimulationComponent> createState() =>
      _LoadingSimulationComponentState();
}

class _LoadingSimulationComponentState
    extends State<LoadingSimulationComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/lottie/loading.json', height: 50, width: 50),
        SizedBox(
          height: Sizes.dp10(context),
        ),
        const Text(
          "Aguarde um momento",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: Sizes.dp11(context),
        ),
        const Text(
          "Estamos simulando seu pedido de\ncrédito rispar.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
