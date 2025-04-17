import 'dart:async';
import 'package:flutter/material.dart';

class CustomDebounce {
  final int milliseconds;
  Timer? _timer;
  CustomDebounce({this.milliseconds = 600});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
