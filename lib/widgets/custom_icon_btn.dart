import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../src/constants/constant.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({
    super.key,
    this.svgPath,
    this.svg,
    this.color,
    this.bgColor,
    this.width,
    this.height,
    this.padding,
    this.radius = 10,
    this.svgWidth,
    this.svgHeight,
    this.onTap,
  }) : assert(!(svgPath != null && svg != null), "You can't use svg and svgPath at same-time");
  final String? svgPath;
  final Widget? svg;
  final Color? color, bgColor;
  final double? width, height, svgWidth, svgHeight;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
          width: width ?? 40,
          height: height ?? 40,
          padding: padding,
          decoration: BoxDecoration(
            color: bgColor ?? Constant.instance.white,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: svgPath != null
                ? SvgPicture.asset(
                    svgPath!,
                    fit: BoxFit.cover,
                    width: svgWidth,
                    height: svgHeight,
                    colorFilter: ColorFilter.mode(color ?? Constant.instance.primary, BlendMode.srcIn),
                  )
                : svg,
          ),
        ),
      ),
    );
  }
}
