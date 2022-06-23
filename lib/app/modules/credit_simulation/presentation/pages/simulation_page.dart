import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../_design_system/styles/color_palettes.dart';
import '../../domain/entities/user_data_entity.dart';
import '../components/custom_linear_progress_bar.dart';
import '../components/steps_for_simulation/calculate_simulation_component.dart';
import '../components/steps_for_simulation/inform_loan_amount_component.dart';
import '../components/steps_for_simulation/loading_simulation_component.dart';
import '../components/steps_for_simulation/simulation_result_component.dart';
import '../controllers/simulation_controller.dart';
import '../states/simulation_states.dart';

class SimulationPage extends StatefulWidget {
  UserDataEntity userData;
  SimulationPage({required this.userData});

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  final _controller = Modular.get<SimulationController>();
  @override
  void initState() {
    _controller.pageController = PageController();
    _controller.userData = widget.userData;
    super.initState();
  }

  @override
  void dispose() {
    _controller.pageController.dispose();
    _controller.progressBarAnimationStore.value = 0.25;
    _controller.simulationStore.value =
        FormsStepByStepInProgressSimulationState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            BackButton(
                color: ColorPalettes.lightPrimary,
                onPressed: () {
                  _controller.navigateLastPage();
                }),
            ValueListenableBuilder(
                valueListenable: _controller.simulationStore,
                builder: (context, state, ___) {
                  if (state is LoadingSimulationState) {
                    return Expanded(
                      child: Container(),
                    );
                  }
                  return ValueListenableBuilder(
                      valueListenable: _controller.progressBarAnimationStore,
                      builder: (context, state, ___) {
                        return CustomLinearProgressBarComponent(
                          percent: _controller.progressBarAnimationStore.value,
                        );
                      });
                }),
            ValueListenableBuilder(
                valueListenable: _controller.simulationStore,
                builder: (context, value, __) {
                  if (value is LoadingSimulationState) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () {
                            _controller.navigateLastPage();
                          },
                          child: Icon(Icons.close,
                              color: ColorPalettes.lightPrimary)),
                    );
                  } else {
                    return Container();
                  }
                })
          ],
        ),
        body: PageView(
          controller: _controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const InformLoanAmountComponent(),
            const CalculateSimulationComponent(),
            const LoadingSimulationComponent(),
            SimulationResultComponent(),
          ],
        ),
      ),
    );
  }
}
