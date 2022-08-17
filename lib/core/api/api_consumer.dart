abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? quaryParam});
  Future<dynamic> post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? quaryParam});
  Future<dynamic> put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? quaryParam});
}
