import 'dart:convert';
import 'dart:io';

import 'package:clean_architcture_islam/core/api/api_consumer.dart';
import 'package:clean_architcture_islam/core/api/app_interceptor.dart';
import 'package:clean_architcture_islam/core/api/end_points.dart';
import 'package:clean_architcture_islam/core/api/status_code.dart';
import 'package:clean_architcture_islam/core/error/excaptions.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:clean_architcture_islam/injection_container.dart' as di;
import 'package:flutter/foundation.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      };
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }
  @override
  Future get(String path, {Map<String, dynamic>? quaryParam}) async {
    try {
      final response = await client.get(path, queryParameters: quaryParam);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      bool supportFormData = false,
      Map<String, dynamic>? quaryParam}) async {
    try {
      final response = await client.post(path,
          queryParameters: quaryParam,
          data: supportFormData ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? quaryParam}) async {
    try {
      final response =
          await client.put(path, queryParameters: quaryParam, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    return jsonDecode(response.data.toString());
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unAutherized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confliect:
            throw const ConflictException();

          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
