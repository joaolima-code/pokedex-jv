import '../helpers/failure.dart';

class SimpleError extends Failure {
  @override
  final String message;

  SimpleError({
    required this.message,
  });
}
