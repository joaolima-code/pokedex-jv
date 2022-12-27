import 'package:flutter_modular/flutter_modular.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'core/config/env_config_impl.dart';
import 'core/connectivity/external/datasource/connectivity_datasource.dart';
import 'core/connectivity/external/repositories/connectivity_repositories_impl.dart';
import 'core/dio/authenticated_user_interceptor.dart';
import 'core/dio/dio_config.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $ConnectivityServiceImpl,
        $ConnectivityDriver,
        Bind((i) => Connectivity()),
        // Configs
        $EnvConfigImpl,
        $AuthenticatedUserInterceptor,
        $dioConfig,
        $authenticatedDio,
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
