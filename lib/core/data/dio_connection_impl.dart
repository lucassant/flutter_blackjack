import 'package:dio/dio.dart';
import 'package:flutter_blackjack/core/data/external_connection.dart';

class DioConnectionImpl extends ExternalConnection {
  final Dio _dio = Dio();

  DioConnectionImpl() {
    _setUrl();
  }

  void _setUrl() {
    _dio.options.baseUrl = 'https://www.deckofcardsapi.com/api/';
  }

  @override
  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    try {
      final Response response = await _dio.get(
        endpoint,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        return data;
      }

      throw Exception('Erro na solicitação: ${response.statusCode}');
    } catch (e) {
      rethrow;
    }
  }
}
