/// Base class for API exceptions
abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

/// Exception for network errors (no connection)
class NetworkException extends ApiException {
  NetworkException([String message = 'Sem conexão com a internet'])
    : super(message);
}

/// Exception for server errors (500+)
class ServerException extends ApiException {
  ServerException([String message = 'Erro no servidor', int? statusCode])
    : super(message, statusCode);
}

/// Exception for unauthorized access (401)
class UnauthorizedException extends ApiException {
  UnauthorizedException([String message = 'Não autorizado'])
    : super(message, 401);
}

/// Exception for not found errors (404)
class NotFoundException extends ApiException {
  NotFoundException([String message = 'Recurso não encontrado'])
    : super(message, 404);
}

/// Exception for timeout errors
class TimeoutException extends ApiException {
  TimeoutException([String message = 'Tempo de requisição esgotado'])
    : super(message);
}

/// Exception for bad request (400)
class BadRequestException extends ApiException {
  BadRequestException([String message = 'Requisição inválida'])
    : super(message, 400);
}
