import 'package:flutter/material.dart';
import '../../domain/entities/loan_datails_entity.dart';
import '../../domain/usecases/simulate_credit_usecase.dart';
import '../states/simulation_states.dart';

class SimulationStore extends ValueNotifier<SimulationState> {
  final SimulateCreditUseCase simulateCreditUseCase;
  SimulationStore(this.simulateCreditUseCase)
      : super(FormsStepByStepInProgressSimulationState());
  Future<void> simulate(LoanDetailsEntity loanDetails) async {
    value = LoadingSimulationState();
    final response = await simulateCreditUseCase(loanDetails);
    await Future.delayed(const Duration(seconds: 2));
    response.fold((l) {}, (r) {
      value = ResultSimulationState(r);
    });
  }
}
