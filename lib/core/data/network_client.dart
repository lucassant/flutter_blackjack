import 'package:dio/dio.dart';

abstract class NetworkClient {
  Future<Response> getRequest(
    String endpoint, {
    String? url,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> postRequest(
    String endpoint,
    dynamic body, {
    String? url,
  });
}
