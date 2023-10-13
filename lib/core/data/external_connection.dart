abstract class ExternalConnection {
  Future<Map<String, dynamic>> getRequest(String endpoint);
}
