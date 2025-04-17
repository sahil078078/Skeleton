import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constant.dart';

class AppToasting {
  AppToasting._();
  final instance = AppToasting._();
  factory AppToasting() => AppToasting._();

  // Success Toast
  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Constants.instance.successToast,
      textColor: Constants.instance.white,
      fontSize: 12.5,
    );
  }

  // Error Toast
  static void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Constants.instance.errorToast,
      textColor: Constants.instance.white,
      fontSize: 12.5,
    );
  }

  // Warning Toast
  static void showWarningToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Constants.instance.warningToast,
      textColor: Constants.instance.white,
      fontSize: 12.5,
    );
  }

  // GreyColor Toast
  static void showGreyToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Constants.instance.toast,
      textColor: Constants.instance.white,
      fontSize: 12.5,
    );
  }
}
