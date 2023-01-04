import 'package:dartz/dartz.dart';

import '../../../helpers/failure.dart';

abstract class ConnectivityRepository {
  Future<Either<Failure, Unit>> isOnline();
}
