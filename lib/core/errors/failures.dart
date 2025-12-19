/// Base failure class for error handling
abstract class Failure {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

/// Server failure (API errors)
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

/// Cache failure (local storage errors)
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

/// Network failure (connection errors)
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

/// Validation failure (input validation errors)
class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.code});
}
