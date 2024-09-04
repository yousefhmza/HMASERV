import 'api_response.dart';

abstract class ApiClient {
  void changeLocale(String languageCode);

  Future<APIResponse> get({required String url, Map<String, dynamic>? queryParameters});

  Future<APIResponse> post<T>({required String url, required var requestBody, Map<String, dynamic>? queryParameters});

  Future<APIResponse> update({required String url, required var requestBody, Map<String, dynamic>? queryParameters});

  Future<APIResponse> delete({required String url, var requestBody, Map<String, dynamic>? queryParameters});
}
