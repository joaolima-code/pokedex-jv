import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../config/env_config.dart';
import 'authenticated_dio.dart';
import 'authenticated_user_interceptor.dart';

AuthenticatedDio createAuthenticatedDio(
  EnvConfig envConfig,
  AuthenticatedUserInterceptor authenticatedUserInterceptor,
) =>
    AuthenticatedNativeDio(
      envConfig,
      authenticatedUserInterceptor,
    );

class AuthenticatedNativeDio extends DioForNative implements AuthenticatedDio {
  AuthenticatedNativeDio(
    EnvConfig envConfig,
    AuthenticatedUserInterceptor authenticatedUserInterceptor,
  ) : super(
          BaseOptions(baseUrl: envConfig.backendUrl),
        ) {
    interceptors.clear();
    interceptors.add(authenticatedUserInterceptor);
  }
}
