import 'package:dio/dio.dart' as http;
import 'package:flutter/material.dart';
import '../helper/app_toasting.dart';
import 'dio_client.dart';
import 'dio_exception_handler.dart';

enum RequestType { get, post, patch, put, delete }

class ApiManager {
  static final http.Dio _dio = DioClient.instance.dio; // Using Singleton DioClient

  //! Universal API Request Method
  static Future<dynamic> request({
    required String endpoint, // Only pass endpoint, not full URL
    RequestType type = RequestType.post,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    try {
      // Convert data to FormData if required
      dynamic requestData = isFormData && data != null ? http.FormData.fromMap(data) : data;

      http.Response response;

      switch (type) {
        case RequestType.get:
          response = await _dio.get(endpoint, queryParameters: queryParams);
          break;
        case RequestType.post:
          response = await _dio.post(endpoint, data: requestData, queryParameters: queryParams);
          break;
        case RequestType.put:
          response = await _dio.put(endpoint, data: requestData, queryParameters: queryParams);
          break;
        case RequestType.patch:
          response = await _dio.patch(endpoint, data: requestData, queryParameters: queryParams);
          break;
        case RequestType.delete:
          response = await _dio.delete(endpoint, queryParameters: queryParams);
          break;
      }

      return response.data; // Return API response
    } on http.DioException catch (error) {
      debugPrint("DIO CATCH ERROR : $error");
      debugPrint("DIO CATCH ERROR : ${error.message}");
      final temp = _handleError(error);
      AppToasting.showErrorToast(temp['message']);
      return temp;
    } catch (error) {
      debugPrint("DIO ERROR : $error");
      final temp = _handleError(error);
      AppToasting.showErrorToast(temp['message']);
      return temp;
    }
  }

  //! Error Handling Method
  static Map<String, dynamic> _handleError(dynamic error) {
    if (error is http.DioException) {
      return {
        "error": true,
        "message": DioExceptionHandler.fromDioError(error).toString(),
        "statusCode": error.response?.statusCode,
        "data": error.response?.data,
      };
    }
    return {
      "error": true,
      "message": "Unexpected error",
      "data": error.response?.data,
    };
  }
}
