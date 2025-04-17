import 'package:dio/dio.dart' as http;
import 'package:flutter/material.dart';

import 'interceptor_service.dart';

class DioClient {
  //! SINGLETON PATTERN
  DioClient._();
  factory DioClient() => DioClient._();
  static final DioClient instance = DioClient._();
  final dio = http.Dio();

  //! Init DioInterCaptor
  initDio() {
    try {
      dio.interceptors.add(InterceptorService());
      dio.options = http.BaseOptions(
        validateStatus: (status) => status != null && [200, 201, 400, 401, 402, 403, 404, 405, 409, 412, 415, 422, 429, 500, 501, 502].contains(status),
        responseType: http.ResponseType.json,
      );
      debugPrint('✅ Dio initialized successfully');
    } catch (e) {
      debugPrint("❌ Dio initialization error: $e");
    }
  }
}
