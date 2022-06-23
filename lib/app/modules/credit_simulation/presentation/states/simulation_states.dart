import '../../domain/entities/result_simulation_entity.dart';

abstract class SimulationState {}

class LoadingSimulationState extends SimulationState {}

class FormsStepByStepInProgressSimulationState extends SimulationState {}

class ResultSimulationState extends SimulationState {
  ResultSimulationEntity result;
  ResultSimulationState(this.result);
}

class ErrorSimulationState extends SimulationState {}
