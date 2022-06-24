import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../_design_system/styles/color_palettes.dart';
import '../../../../../_design_system/widgets/custom_button_widget.dart';
import '../../../../../_design_system/widgets/custom_input_widget.dart';
import '../../controllers/simulation_controller.dart';

class InformLoanAmountComponent extends StatefulWidget {
  const InformLoanAmountComponent({Key? key}) : super(key: key);

  @override
  State<InformLoanAmountComponent> createState() =>
      _InformLoanAmountComponentState();
}

class _InformLoanAmountComponentState extends State<InformLoanAmountComponent> {
  final _controller = Modular.get<SimulationController>();
  bool isValidButton = true;
  final _moneyTextController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
      thousandSeparator: '.',
      initialValue: 1000);
  @override
  void initState() {
    _moneyTextController.addListener(() {
      setState(() {
        if (_moneyTextController.numberValue >= 1000 &&
            _moneyTextController.numberValue <= 300000) {
          isValidButton = true;
        } else {
          isValidButton = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'De quanto ',
                style: TextStyle(
                    color: Color(0xFF149797),
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                      text: 'você precisa?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
            RichText(
              key: Key("description"),
              text: TextSpan(
                text: 'Insira um valor entre ',
                style: TextStyle(
                    fontSize: 15,
                    color: ColorPalettes.black,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                      text: 'R\$ 1000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorPalettes.black)),
                  TextSpan(
                      text: ' a ',
                      style: TextStyle(
                          color: ColorPalettes.black,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: 'R\$ 300.000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorPalettes.black)),
                ],
              ),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.center,
                child: CustomInputWiget(
                  controller: _moneyTextController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: ColorPalettes.accentPrimary),
                )),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButtonWidget(
          title: "Continuar",
          onPressed: () {
            _controller.amount = _moneyTextController.numberValue;
            _controller.navigateNextPage();
          },
          enabled: isValidButton),
    );
  }
}
