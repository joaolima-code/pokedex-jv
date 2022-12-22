import 'package:dio/dio.dart';

import '../config/env_config.dart';
import 'authenticated_user_interceptor.dart';
import 'entry_stub_error.dart'
    if (dart.library.io) 'authenticated_native_dio.dart';

abstract class AuthenticatedDio with DioMixin implements Dio {
  factory AuthenticatedDio(
    EnvConfig envConfig,
    AuthenticatedUserInterceptor authenticatedUserInterceptor,
  ) =>
      createAuthenticatedDio(
        envConfig,
        authenticatedUserInterceptor,
      );
}
