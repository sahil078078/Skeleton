import 'package:dio/dio.dart';

import '../helper/app_toasting.dart';

class DioExceptionHandler implements Exception {
  late String errorMessage;

  DioExceptionHandler.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to the server was cancelled';
        break;

      case DioExceptionType.badCertificate:
        errorMessage = 'Request has incorrect certificate as configured';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Request connection error';
        break;

      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request send timeout';
        break;
      case DioExceptionType.badResponse:
        errorMessage = handleStatusCode(statusCode: dioError.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Something went wrong';
        break;
    }
  }

  @override
  String toString() => errorMessage;
}

String handleStatusCode({int? statusCode, bool showToast = false}) {
  String msg = 'Oops something went wrong!';
  switch (statusCode) {
    case 400:
      msg = 'Bad request';
      break;
    case 401:
      msg = 'Authentication failed';
      break;
    case 403:
      msg = 'The authenticated user is not allowed to access the specified API endpoint';
      break;
    case 404:
      msg = 'The requested resource does not exist';
      break;
    case 405:
      msg = 'Method not allowed. Please check the Allow header for the allowed HTTP methods';
      break;
    case 415:
      msg = 'Unsupported media type. The requested content type or version number is invalid';
      break;
    case 422:
      msg = 'Data validation failed';
      break;
    case 429:
      msg = 'Too many requests';
      break;
    case 500:
      msg = 'Internal server error';
      break;
    default:
      msg = 'Oops something went wrong!';
      break;
  }

  if (showToast) {
    AppToasting.showErrorToast(msg);
  }

  return msg;
}
