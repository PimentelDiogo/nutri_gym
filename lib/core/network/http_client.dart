import 'dart:async' as async_lib;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../errors/api_exception.dart';

/// HTTP client wrapper for API calls
class HttpClient {
  final http.Client _client;

  HttpClient({http.Client? client}) : _client = client ?? http.Client();

  /// GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
      final response = await _client
          .get(url, headers: ApiConfig.defaultHeaders)
          .timeout(ApiConfig.timeout);

      return _handleResponse(response);
    } on async_lib.TimeoutException {
      throw TimeoutException();
    } on SocketException {
      throw NetworkException();
    } catch (e) {
      throw ServerException('Erro inesperado: $e');
    }
  }

  /// POST request
  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
      final response = await _client
          .post(url, headers: ApiConfig.defaultHeaders, body: jsonEncode(body))
          .timeout(ApiConfig.timeout);

      return _handleResponse(response);
    } on async_lib.TimeoutException {
      throw TimeoutException();
    } on SocketException {
      throw NetworkException();
    } catch (e) {
      throw ServerException('Erro inesperado: $e');
    }
  }

  /// Handle HTTP response
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return {};
      }
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    // Handle error status codes
    switch (response.statusCode) {
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 404:
        throw NotFoundException();
      case >= 500:
        throw ServerException(
          'Erro no servidor (${response.statusCode})',
          response.statusCode,
        );
      default:
        throw ServerException(
          'Erro HTTP ${response.statusCode}',
          response.statusCode,
        );
    }
  }

  /// Close the client
  void close() {
    _client.close();
  }
}
