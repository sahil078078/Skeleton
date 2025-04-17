import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth, elevation;
  final RefreshIndicatorTriggerMode? triggerMode;
  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.strokeWidth,
    this.elevation,
    this.triggerMode,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: color ?? Constants.instance.primary,
      backgroundColor: backgroundColor ?? Constants.instance.white,
      strokeWidth: strokeWidth ?? 1.5,
      elevation: elevation ?? 1.5,
      triggerMode: triggerMode ?? RefreshIndicatorTriggerMode.onEdge,
      child: child,
    );
  }
}
