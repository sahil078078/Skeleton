import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constant.dart';

class Util {
  Util._();
  factory Util() => Util._();

  static String formattedTime(int time) {
    final int sec = time % 60;
    final int min = (time / 60).floor();
    return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }

  static Widget formFieldSuffix({
    required String svg,
    Color? color,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: SizedBox(
          width: width ?? 22,
          height: height ?? 22,
          child: Padding(
            padding: padding ?? const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
            child: SvgPicture.asset(
              width: width ?? 15,
              height: height ?? 15,
              svg,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(color ?? Constants.instance.grey500, BlendMode.srcIn),
            ),
          ),
        ),
      );

  static Widget verticalDivider({
    Color? color,
    double? thickness,
    double? width,
    double? endIndent,
    double? indent,
    EdgeInsetsGeometry? padding,
  }) =>
      Padding(
        padding: padding ?? EdgeInsets.zero,
        child: VerticalDivider(
          width: width ?? 2,
          color: color ?? Constants.instance.grey100,
          endIndent: endIndent ?? 03,
          indent: indent ?? 03,
          thickness: thickness ?? 1,
        ),
      );

  static Widget horizontalDivider({
    Color? color,
    double? height,
    double? endIndent,
    double? indent,
    double? thickness,
    EdgeInsetsGeometry? padding,
  }) =>
      Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Divider(
          color: color ?? Constants.instance.grey100,
          height: height ?? 0,
          endIndent: endIndent ?? 0,
          indent: indent ?? 0,
          thickness: thickness ?? 1.5,
        ),
      );

  //! DelayFunction

  static Future customDelay({int milliseconds = 150, Future<dynamic> Function()? computation}) => Future.delayed(
        Duration(milliseconds: milliseconds),
        computation,
      );
}
