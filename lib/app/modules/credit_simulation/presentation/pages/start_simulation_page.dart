import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rispar/app/_design_system/styles/color_palettes.dart';
import '../../../../_design_system/utils/sizes.dart';
import '../../../../_design_system/widgets/custom_button_widget.dart';
import '../../../../_design_system/widgets/custom_input_widget.dart';
import '../controllers/start_simulation_controller.dart';

class StartSimulationPage extends StatefulWidget {
  const StartSimulationPage({Key? key}) : super(key: key);
  @override
  State<StartSimulationPage> createState() => _StartSimulationPageState();
}

class _StartSimulationPageState extends State<StartSimulationPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = Modular.get<StartSimulationController>();
  @override
  void initState() {
    _controller.emailTextController.addListener(() {
      setState(() {
        _controller.validateEmail(_controller.emailTextController.text);
      });
    });
    _controller.nameTextController.addListener(() {
      _controller.validateFullName(_controller.nameTextController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: ColorPalettes.lightBlue,
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/user-with-phone.png",
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.2,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Simule ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'agora',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF149797))),
                            ],
                          ),
                        ),
                        SizedBox(height: Sizes.dp10(context)),
                        const Text("Crédito rápido, fácil e seguro! :)"),
                        SizedBox(
                          height: Sizes.dp30(context),
                        ),
                        CustomInputWiget(
                          controller: _controller.nameTextController,
                          label: RichText(
                            text: const TextSpan(
                              text: 'Qual seu ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'nome completo?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          hintText: "Nome Completo",
                          validator: _controller.validateFullName,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: Sizes.dp25(context),
                        ),
                        CustomInputWiget(
                          controller: _controller.emailTextController,
                          label: RichText(
                            text: const TextSpan(
                              text: 'Qual seu ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'e-mail?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          hintText: "seuemail@email.com",
                          validator: _controller.validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomButtonWidget(
            title: "Continuar",
            enabled: _controller.buttonEnabled,
            onPressed: () {
              _controller.startSimulation();
            }));
  }
}
