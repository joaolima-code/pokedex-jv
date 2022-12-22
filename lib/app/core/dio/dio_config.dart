import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config/env_config.dart';
import 'authenticated_dio.dart';
import 'authenticated_user_interceptor.dart';

Dio unauthenticatedDio(EnvConfig envConfig) => Dio(
      BaseOptions(
        baseUrl: envConfig.backendUrl,
      ),
    );

final $dioConfig = BindInject(
  (i) => unauthenticatedDio(i<EnvConfig>()),
  isSingleton: true,
  isLazy: true,
);

final $authenticatedDio = BindInject(
  (i) => AuthenticatedDio(i<EnvConfig>(), i<AuthenticatedUserInterceptor>()),
  isSingleton: true,
  isLazy: true,
);
