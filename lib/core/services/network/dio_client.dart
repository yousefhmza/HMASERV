import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hmaserv/core/services/network/api_client.dart';
import 'package:hmaserv/core/services/network/api_response.dart';

import '../../resources/resources.dart';
import '../../utils/constants.dart';

const String _baseURL = Constants.appDomain;
const String _contentType = "Content-Type";
const String _accept = "accept";
const String _applicationJson = "application/json";
const String _acceptLanguage = "Accept-Language";

class DioClient extends ApiClient{
  final Dio _dio;
  final Interceptor _prettyDioLogger;

  DioClient(this._dio, this._prettyDioLogger) {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: _baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: Time.t1m,
      receiveTimeout: Time.t1m,
      sendTimeout: Time.t1m,
      headers: {
        _contentType: _applicationJson,
        _accept: _applicationJson,
      },
    );

    _dio.options = baseOptions;

    if (kDebugMode) _dio.interceptors.add(_prettyDioLogger);
  }

  @override
  void changeLocale(String languageCode) => _dio.options.headers[_acceptLanguage] = languageCode;

  @override
  Future<APIResponse> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: {},
      ),
    );
    return APIResponse(statusCode: response.statusCode, data: response.data);
  }

  @override
  Future<APIResponse> post<T>({
    required String url,
    required var requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post<T>(
      url,
      queryParameters: queryParameters,
      data: requestBody,
      options: Options(
        headers: {},
      ),
    );
    return APIResponse(statusCode: response.statusCode, data: response.data);
  }

  @override
  Future<APIResponse> update({
    required String url,
    required var requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.put(
      url,
      queryParameters: queryParameters,
      data: requestBody,
      options: Options(
        headers: {},
      ),
    );
    return APIResponse(statusCode: response.statusCode, data: response.data);
  }

  @override
  Future<APIResponse> delete({
    required String url,
    var requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.delete(
      url,
      queryParameters: queryParameters,
      data: requestBody,
      options: Options(
        headers: {},
      ),
    );
    return APIResponse(statusCode: response.statusCode, data: response.data);
  }
}
