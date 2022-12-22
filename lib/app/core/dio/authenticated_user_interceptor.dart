import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'authenticated_user_interceptor.g.dart';

@Injectable(singleton: true)
class AuthenticatedUserInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 404) {
      err.response!.data = {'message': 'Página não encontrada'};

      return handler.next(err);
    }

    return handler.reject(err);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }
}
