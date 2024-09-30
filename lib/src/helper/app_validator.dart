import 'package:flutter/services.dart';

class AppValidator {
  AppValidator._();
  factory AppValidator() => AppValidator._();

  //! Validator

  //* Required mobile validator
  //* mobile validator
  static String? mobileNumberValidator(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return "Please enter phone number";
    } else {
      if (phone.trim().startsWith('0')) {
        return 'Mobile number can\'t  start with 0';
      } else if (phone.trim().length != 10) {
        return "Invalid number";
      } else {
        return null;
      }
    }
  }

  //* Email Validator
  static String? emailValidator(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please enter email address';
    } else {
      Pattern pattern =
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
      RegExp regexp = RegExp(pattern.toString());
      if (regexp.hasMatch(email.trim())) {
        return null;
      } else {
        return "Please enter valid email";
      }
    }
  }

  static String? notEmptyValidator(String? value, String error) {
    if (value != null && value.trim().isNotEmpty) return null;
    return error;
  }

  //* Not Required Validator
  //* mobile validator
  static String? mobileNumberNotRequiredValidator(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return null; // true
    } else {
      if (phone.trim().startsWith('0')) {
        return 'Mobile number can\'t  start with 0';
      } else if (phone.trim().length != 10) {
        return "Invalid number";
      } else {
        return null;
      }
    }
  }

  //* Email Validator
  static String? emailNotRequiredValidator(String? email) {
    if (email == null || email.trim().isEmpty) {
      return null;
    } else {
      Pattern pattern =
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
      RegExp regexp = RegExp(pattern.toString());
      if (regexp.hasMatch(email.trim())) {
        return null;
      } else {
        return "Please enter valid email";
      }
    }
  }

  //! Input Format

  static final mobileInputFormatters = <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))];
  static final realPositiveFormatters = <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))];
}
