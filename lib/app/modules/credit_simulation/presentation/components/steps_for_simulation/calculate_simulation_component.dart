import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../_design_system/widgets/custom_button_widget.dart';
import '../../controllers/simulation_controller.dart';

class CalculateSimulationComponent extends StatefulWidget {
  const CalculateSimulationComponent({Key? key}) : super(key: key);

  @override
  State<CalculateSimulationComponent> createState() =>
      _CalculateSimulationComponentState();
}

class _CalculateSimulationComponentState
    extends State<CalculateSimulationComponent> {
  final _controller = Modular.get<SimulationController>();

  List termsLabel = [
    buildLabel("3"),
    buildLabel("6"),
    buildLabel("9"),
    buildLabel("12")
  ];
  List ltvsLabel = [
    buildLabel("20%"),
    buildLabel("35%"),
    buildLabel("50%"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _space(30),
              const Align(
                child: Text(
                  "Valor escolhido",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                alignment: Alignment.centerLeft,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "R\$ ${_controller.amount}",
                  style: const TextStyle(
                      fontSize: 29,
                      color: Color(0xFF3F9798),
                      fontWeight: FontWeight.w700),
                ),
              ),
              _space(25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Escolha a ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'quantidade de parcelas',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  _space(15),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color(0xFF3F9798),
                      inactiveTrackColor: Colors.grey[300],
                      inactiveTickMarkColor: Colors.grey[300],
                      activeTickMarkColor: const Color(0xFF3F9798),
                      tickMarkShape:
                          const RoundSliderTickMarkShape(tickMarkRadius: 10),
                      rangeThumbShape: const RoundRangeSliderThumbShape(
                          enabledThumbRadius: 3, disabledThumbRadius: 8),
                      trackShape: const RectangularSliderTrackShape(),
                      trackHeight: 10,
                      thumbShape: const DonutSliderThumbShape(
                          enabledThumbRadius: 23, disabledThumbRadius: 2),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Slider(
                        min: 1,
                        max: 4,
                        divisions: 3,
                        onChanged: (value) {
                          setState(() {
                            _controller.termValueSelected = value;
                          });
                        },
                        value: _controller.termValueSelected,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var label in termsLabel) ...{label}
                      ],
                    ),
                  )
                ],
              ),
              _space(25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Escolha o ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'percentual de garantia',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  _space(15),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color(0xFF3F9798),
                      inactiveTrackColor: Colors.grey[300],
                      inactiveTickMarkColor: Colors.grey[300],
                      activeTickMarkColor: const Color(0xFF3F9798),
                      tickMarkShape:
                          const RoundSliderTickMarkShape(tickMarkRadius: 10),
                      rangeThumbShape: const RoundRangeSliderThumbShape(
                          enabledThumbRadius: 3, disabledThumbRadius: 8),
                      trackShape: const RectangularSliderTrackShape(),
                      trackHeight: 10,
                      thumbShape: const DonutSliderThumbShape(
                          enabledThumbRadius: 23, disabledThumbRadius: 2),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Slider(
                        min: 1,
                        max: 3,
                        divisions: 2,
                        onChanged: (value) {
                          setState(() {
                            _controller.ltvValueSelected = value;
                          });
                        },
                        value: _controller.ltvValueSelected,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var label in ltvsLabel) ...{label}
                      ],
                    ),
                  )
                ],
              ),
              _space(35),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Garantia protegida",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF3F9798),
                      fontWeight: FontWeight.w600),
                ),
              ),
              _space(10),
              Row(
                children: const [
                  Flexible(
                    flex: 7,
                    child: Text(
                      "Bitcoin caiu? Fique tranquilo! Na garantia protegida, você não recebe chamada de margem e não é liquidado.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtonWidget(
              title: "Continuar sem garantia",
              onPressed: () {
                _controller.simulate(false);
              },
              enabled: true,
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 35,
                right: 35,
              ),
              noBackground: true),
          CustomButtonWidget(
              title: "Adicionar garantia",
              onPressed: () {
                _controller.simulate(true);
              },
              enabled: true)
        ],
      ),
    );
  }
}

Widget _space(double space) {
  return SizedBox(height: space);
}

Widget buildLabel(String title) {
  return Text(
    title,
    style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
  );
}

class DonutSliderThumbShape extends SliderComponentShape {
  const DonutSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
  });

  final double enabledThumbRadius;

  final double? disabledThumbRadius;
  double get _disabledThumbRadius => disabledThumbRadius!;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: const Color(0xFF3F9798),
      end: const Color(0xFF3F9798),
    );

    final Paint paint = Paint()
      ..color = colorTween.evaluate(enableAnimation)!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        center, (radiusTween.evaluate(enableAnimation) * 0.7), paint);
  }
}
