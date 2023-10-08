import 'package:dio/dio.dart';

import 'network_client.dart';

class NetworkClientImpl implements NetworkClient {
  NetworkClientImpl() {
    _setUrl();
  }

  final Dio _dio = Dio();

  void _setUrl() {
    _dio.options.baseUrl = 'https://www.deckofcardsapi.com/api/';
  }

  @override
  Future<Response> getRequest(
    String endpoint, {
    String? url,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement getRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> postRequest(
    String endpoint,
    body, {
    String? url,
  }) {
    // TODO: implement postRequest
    throw UnimplementedError();
  }
}
