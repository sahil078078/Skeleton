import 'package:flutter/material.dart';
import '../../helper/app_extensions.dart';
import '../../constants/constant.dart';
import 'custom_btn.dart';

class CustomSwitchBtn extends StatelessWidget {
  final ValueChanged<int> onLeft;
  final ValueChanged<int> onRight;
  final String? leftText, rightText;
  final Widget? left, right;
  final int isLeft;

  final EdgeInsetsGeometry? btnPadding;
  final double width, height;

  const CustomSwitchBtn({
    super.key,
    this.isLeft = 0,
    required this.onLeft,
    required this.onRight,
    this.leftText,
    this.rightText,
    this.left,
    this.right,
    this.btnPadding,
    this.width = 28,
    this.height = 28,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(color: Constants.instance.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBtn(
            height: height,
            width: width,
            padding: btnPadding ?? EdgeInsets.zero,
            bgColor: isLeft == 0 ? Constants.instance.blue50 : Constants.instance.transparent,
            borderColor: Constants.instance.transparent,
            text: leftText,
            child: left,
            onTap: () => onLeft(0),
          ),
          Constants.instance.square.copyWith(width: 5, height: 0),
          CustomBtn(
            height: height,
            width: width,
            padding: btnPadding ?? EdgeInsets.zero,
            bgColor: isLeft == 1 ? Constants.instance.blue50 : Constants.instance.transparent,
            borderColor: Constants.instance.transparent,
            text: rightText,
            child: right,
            onTap: () => onRight(1),
          )
        ],
      ),
    );
  }
}
