import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppPicker {
  //! SingletonPattern
  AppPicker._();
  static AppPicker instance = AppPicker._();
  factory AppPicker() => instance;

  //* ImagePicker

  static final _picker = ImagePicker();

  static Future<File?> imagePicker({ImageSource source = ImageSource.gallery}) async {
    final file = await _picker.pickImage(
      source: source,
      imageQuality: 100,
      requestFullMetadata: false,
    );

    if (file == null) return null;
    final image = File(file.path);
    return image;
  }

  //* DatePicker

  static Future<DateTime?> datePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? title,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1970),
      lastDate: lastDate ?? DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: title,
    );

    return date;
  }
}
