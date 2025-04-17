import 'package:flutter/cupertino.dart';
import '../helper/app_extensions.dart';
import '../constants/constant.dart';
import '../helper/app_text_style.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
  });
  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;
  final String? subTitle;
  final TextStyle? titleStyle, subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle ?? AppTextStyle.semiBold.copyWith(fontSize: 15, color: Constants.instance.black),
              ),
              if (subTitle.notEmptyNotNull)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    subTitle ?? "",
                    style: subTitleStyle ?? AppTextStyle.regular.copyWith(fontSize: 12.5, color: Constants.instance.grey700, height: 1.35),
                  ),
                ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 45, minWidth: 40, minHeight: 25, maxHeight: 26),
          margin: EdgeInsets.only(left: 15),
          child: Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
              applyTheme: false,
            ),
          ),
        ),
      ],
    );
  }
}
