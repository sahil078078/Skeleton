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

  //! GST Validator
  static String? gstValidator(String? gstNumber) {
    if (gstNumber == null || gstNumber.trim().isEmpty) {
      return "GST number is required";
    } else {
      // Correct regex for Indian GST number
      Pattern pattern = r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
      RegExp regexp = RegExp(pattern.toString());

      if (regexp.hasMatch(gstNumber.trim())) {
        return null; // Valid GST number
      } else {
        return "Please enter a valid GST number";
      }
    }
  }

  //! Optional GST Validator (if GST is not required)
  static String? gstNotRequiredValidator(String? gstNumber) {
    if (gstNumber == null || gstNumber.trim().isEmpty) {
      return null;
    } else {
      // Correct regex for Indian GST number
      Pattern pattern = r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
      RegExp regexp = RegExp(pattern.toString());

      if (regexp.hasMatch(gstNumber.trim())) {
        return null; // Valid GST number
      } else {
        return "Please enter a valid GST number";
      }
    }
  }

  //! PAN Card Validator
  static String? panValidator(String? panNumber) {
    if (panNumber == null || panNumber.trim().isEmpty) {
      return "PAN number is required";
    } else {
      // Correct regex for Indian PAN number
      Pattern pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
      RegExp regexp = RegExp(pattern.toString());

      if (regexp.hasMatch(panNumber.trim())) {
        return null; // Valid PAN number
      } else {
        return "Please enter a valid PAN number";
      }
    }
  }

  //! Optional PAN Card Validator (if PAN is not required)
  static String? panNotRequiredValidator(String? panNumber) {
    if (panNumber == null || panNumber.trim().isEmpty) {
      return null; // PAN is optional, so no error
    } else {
      // Correct regex for Indian PAN number
      Pattern pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
      RegExp regexp = RegExp(pattern.toString());

      if (regexp.hasMatch(panNumber.trim())) {
        return null; // Valid PAN number
      } else {
        return "Please enter a valid PAN number";
      }
    }
  }

  //! Input Format

  static final mobileInputFormatters = <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))];
  static final realPositiveFormatters = <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))];
}
