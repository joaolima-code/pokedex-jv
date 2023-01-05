import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergh/app/core/errors/messages.dart';

import '../drivers/connectivity_driver.dart';
import '../../../errors/errors.dart';
import '../../domain/service/connectivity_service.dart';
import '../../../helpers/failure.dart';

part 'connectivity_service_impl.g.dart';

@Injectable(singleton: false)
class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver driver;

  ConnectivityServiceImpl(this.driver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await driver.isOnline;

      if (check) {
        return const Right(unit);
      }

      throw SimpleError(message: Messages.OFFLINE_CONNECTION);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        SimpleError(
          message: Messages.FAILED_CONNECTION,
        ),
      );
    }
  }
}
