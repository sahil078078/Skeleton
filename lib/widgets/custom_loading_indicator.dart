import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../src/constants/constant.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.isIosStyle = false,
    this.dimension = 20,
    this.color,
    this.strokeWidth = 1.6,
    this.backgroundColor,
  });
  final bool isIosStyle;
  final double dimension, strokeWidth;
  final Color? color, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: isIosStyle
            ? CupertinoActivityIndicator(
                animating: true,
                color: color ?? Constant.instance.primary,
              )
            : CircularProgressIndicator(
                color: color,
                strokeCap: StrokeCap.round,
                backgroundColor: backgroundColor ?? Constant.instance.primary15,
                strokeWidth: strokeWidth,
              ),
      ),
    );
  }
}
