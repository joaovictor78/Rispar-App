import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/entities/loan_datails_entity.dart';
import '../../domain/entities/user_data_entity.dart';
import '../../domain/value_objects/amount_vo.dart';
import '../../domain/value_objects/ltv_vo.dart';
import '../../domain/value_objects/term_vo.dart';
import '../states/simulation_states.dart';
import '../stores/progress_bar_animation_store.dart';
import '../stores/simulation_store.dart';

class SimulationController {
  late PageController pageController;
  int _currentPage = 0;
  SimulationStore simulationStore;
  late UserDataEntity userData;
  double amount = 0.0;
  double ltvValueSelected = 1;
  double termValueSelected = 1;
  ProgressBarAnimationStore progressBarAnimationStore;
  SimulationController(this.progressBarAnimationStore, this.simulationStore);

  void navigateNextPage() {
    progressBarAnimationStore.navigateNextPage();
    _currentPage = getPageByProgressBarPercent();
    pageController.jumpToPage(_currentPage);
  }

  void navigateLastPage() {
    if (pageController.page == 0) {
      Modular.to.pop();
      return;
    } else if (pageController.page == 3) {
      progressBarAnimationStore.navigateLastPage();
      progressBarAnimationStore.navigateLastPage();
      simulationStore.value = FormsStepByStepInProgressSimulationState();
      pageController.jumpToPage(1);
    } else {
      progressBarAnimationStore.navigateLastPage();
      _currentPage = getPageByProgressBarPercent();
      pageController.jumpToPage(_currentPage);
    }
  }

  int getPageByProgressBarPercent() {
    if (progressBarAnimationStore.value == 0.25) {
      return 0;
    } else if (progressBarAnimationStore.value == 0.50) {
      return 1;
    } else if (progressBarAnimationStore.value == 0.75) {
      return 2;
    } else {
      return 3;
    }
  }

  void simulate(bool hasProtectedCollateral) async {
    simulationStore.value = LoadingSimulationState();
    navigateNextPage();

    await simulationStore.simulate(LoanDetailsEntity(
        user: userData,
        term: TermVO(termValueSelected.toInt() * 3),
        hasProtectedCollateral: hasProtectedCollateral,
        ltv: LtvVO((ltvValueSelected.toInt() == 1
            ? 20
            : (ltvValueSelected.toInt() * 15) + 5)),
        amount: AmountVO(amount)));
    if (simulationStore.value is ResultSimulationState) {
      navigateNextPage();
    }
  }
}
