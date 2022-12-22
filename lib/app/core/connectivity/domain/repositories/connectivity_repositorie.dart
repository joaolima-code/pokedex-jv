import 'package:dartz/dartz.dart';

import '../../../helpers/failure.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
