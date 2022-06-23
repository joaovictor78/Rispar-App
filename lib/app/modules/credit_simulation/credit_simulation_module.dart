import 'package:flutter_modular/flutter_modular.dart';
import '../../core/network/custom_dio/custom_dio.dart';
import 'domain/usecases/simulate_credit_usecase.dart';
import 'external/datasource/simulation_datasource.dart';
import 'infra/repositories/simulation_repository.dart';
import 'presentation/controllers/simulation_controller.dart';
import 'presentation/controllers/start_simulation_controller.dart';
import 'presentation/pages/simulation_page.dart';
import 'presentation/pages/start_simulation_page.dart';
import 'presentation/stores/progress_bar_animation_store.dart';
import 'presentation/stores/simulation_store.dart';

class CreditSimulationModule extends Module {
  @override
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartSimulationController()),
    Bind.lazySingleton((i) => ProgressBarAnimationStore()),
    Bind.lazySingleton((i) => SimulationDataSource(i<CustomDio>())),
    Bind.lazySingleton((i) => SimulationRepository(i<SimulationDataSource>())),
    Bind.lazySingleton((i) => SimulateCreditUseCase(i<SimulationRepository>())),
    Bind.lazySingleton((i) => SimulationStore(i<SimulateCreditUseCase>())),
    Bind.lazySingleton((i) => SimulationController(
        i<ProgressBarAnimationStore>(), i<SimulationStore>()))
  ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const StartSimulationPage(),
        ),
        ChildRoute('/simulation',
            child: (context, args) => SimulationPage(userData: args.data)),
      ];
}
