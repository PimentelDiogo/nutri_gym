/// API configuration
class ApiConfig {
  ApiConfig._();

  /// Base URL do mock server Apiary
  static const String baseUrl =
      'https://private-21c882-diogosompo.apiary-mock.com';

  /// Timeout padrão para requisições
  static const Duration timeout = Duration(seconds: 30);

  /// Headers padrão
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
