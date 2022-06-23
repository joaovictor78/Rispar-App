import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/core/network/custom_dio/custom_dio.dart';
import 'app/core/network/utils/constants.dart';
import 'app/modules/credit_simulation/credit_simulation_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio()),
        Bind.singleton((i) => CustomDio(i<Dio>(), Settings.API_URL))
      ];

  @override
  List<ModularRoute> get routes =>
      [ModuleRoute(Modular.initialRoute, module: CreditSimulationModule())];
}
