import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import 'custom_icon_btn.dart';

class CustomCloseBtn extends StatelessWidget {
  const CustomCloseBtn({
    super.key,
    this.onClose,
    this.bgColor,
    this.size,
  });
  final GestureTapCallback? onClose;
  final Color? bgColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CustomIconBtn(
      onTap: onClose, // ?? () => backScreen(),
      // svgPath: Graphics.instance.crossMark,
      bgColor: bgColor ?? Constants.instance.grey100,
      height: size ?? 30,
      width: size ?? 30,
      radius: size ?? 30,
      padding: const EdgeInsets.all(5),
      color: Constants.instance.black,
    );
  }
}
