import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class InterceptorService implements Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("onRequest");
    // options.baseUrl = ApiConstant.mobileBaseURL; // YOUR BASE URL
    options.headers.addAll({
      'Accept': 'application/json',
      'content-type': 'application/json',
    });

    // if (sf.sharedPref.authToken.isNotEmpty) {
    // options.headers['Authorization'] = 'Bearer ${sharedPref.authToken}';
    // }

    debugPrint('HEADERS : ${options.headers}');

    options.validateStatus = (int? status) => status != null && status > 0;

    debugPrint("URL : ${options.uri}");
    debugPrint("REQUEST BODY  : ${options.data}");

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('OnResponse');
    debugPrint('OnResponse : ${response.statusCode}');
    debugPrint('OnResponse : ${response.statusMessage}');
    debugPrint('OnResponse : ${response.data}');

    // handleStatusCode(statusCode: response.statusCode, showToast: true);
    // if (response.statusCode == 500) {}

    return handler.next(response);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    return handler.next(error);
  }
}
