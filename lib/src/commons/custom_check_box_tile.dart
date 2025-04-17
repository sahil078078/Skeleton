import 'package:flutter/material.dart';
import '../helper/app_extensions.dart';
import '../constants/constant.dart';
import '../helper/app_text_style.dart';

class CustomCheckboxTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChange;
  final String? title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final double titleGap, height;
  final EdgeInsetsGeometry? padding;
  final double? scale;
  final WidgetStateProperty<Color?>? fillColor;

  const CustomCheckboxTile({
    super.key,
    this.fillColor,
    this.value = false,
    required this.onChange,
    this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.titleGap = 10,
    this.height = 0,
    this.padding,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange(!value),
      child: Padding(
        padding: padding ?? const EdgeInsets.only(top: 2, bottom: 2, right: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: scale ?? 1,
              child: Checkbox(
                fillColor: fillColor,
                value: value,
                activeColor: Constants.instance.apple,
                checkColor: Constants.instance.blue50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                side: BorderSide(color: Constants.instance.grey400, width: 0.75),
                onChanged: (val) => onChange(val ?? false),
              ),
            ),
            Constants.instance.square.copyWith(height: 0, width: titleGap),
            if (title.notEmptyNotNull || subtitle.notEmptyNotNull)
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title.notEmptyNotNull) Text(title!, style: titleStyle ?? AppTextStyle.medium.copyWith(fontSize: 12.5, color: Constants.instance.black)),
                    Constants.instance.square.copyWith(width: 0, height: height),
                    if (subtitle.notEmptyNotNull)
                      Text(subtitle!, style: subtitleStyle ?? AppTextStyle.regular.copyWith(fontSize: 12, color: Constants.instance.grey400))
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
