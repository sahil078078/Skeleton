import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../helper/app_text_style.dart';
import 'custom_rich_text.dart';

class CustomDropdownBtn<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final Widget? hint;
  final String? hintText, label;
  final double? btnWidth, btnHeight, dropDownMaxHeight;
  final bool isRequiredMark;
  final TextStyle? labelStyle;
  final BoxDecoration? btnDecoration;
  const CustomDropdownBtn({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    this.hint,
    this.hintText,
    this.btnWidth,
    this.btnHeight,
    this.dropDownMaxHeight,
    this.label,
    this.labelStyle,
    this.isRequiredMark = false,
    this.btnDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: CustomRichText(
              text1: "$label",
              text2: isRequiredMark ? "*" : null,
              style: labelStyle ??
                  AppTextStyle.medium.copyWith(
                    fontSize: 13,
                    color: Constants.instance.black,
                  ),
              style2: AppTextStyle.medium.copyWith(
                fontSize: 17,
                height: 0.5,
                color: Constants.instance.red,
              ),
            ),
          ),

        //TODO : DROPDOWN BTN 2
        // DropdownButton2<T>(
        //   items: items,
        //   isDense: true,
        //   iconStyleData: IconStyleData(
        //     iconSize: 20,
        //     icon: Padding(
        //       padding: const EdgeInsets.only(right: 6),
        //       child: Icon(Icons.keyboard_arrow_down_rounded, color: Constants.instance.primary),
        //     ),
        //     openMenuIcon: Padding(
        //       padding: const EdgeInsets.only(right: 6),
        //       child: Icon(Icons.keyboard_arrow_up_rounded, color: Constants.instance.grey500),
        //     ),
        //     iconEnabledColor: Constants.instance.primary,
        //     iconDisabledColor: Constants.instance.greyShade300,
        //   ),
        //   isExpanded: true,
        //   hint: hintText.notEmptyNotNull
        //       ? Text(
        //           hintText!,
        //           style: AppTextStyle.regular.copyWith(color: Constants.instance.greyShade700, fontSize: 12.5),
        //           overflow: TextOverflow.ellipsis,
        //         )
        //       : hint,
        //   style: AppTextStyle.medium.copyWith(fontSize: 13.5, color: Constants.instance.primary),
        //   customButton: null,
        //   menuItemStyleData: const MenuItemStyleData(height: 38),
        //   underline: const SizedBox.shrink(),
        //   dropdownStyleData: DropdownStyleData(
        //     elevation: 1,
        //     offset: const Offset(0, -10),
        //     padding: EdgeInsets.zero,
        //     useSafeArea: true,
        //     maxHeight: dropDownMaxHeight ?? 450,
        //     isOverButton: false,
        //     useRootNavigator: true,
        //     scrollPadding: EdgeInsets.zero,
        //     decoration: BoxDecoration(
        //       color: Constants.instance.white,
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //   ),
        //   onChanged: onChanged,
        //   value: value,
        //   buttonStyleData: ButtonStyleData(
        //     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        //     height: btnHeight ?? 42,
        //     width: btnWidth,
        //     decoration: btnDecoration ??
        //         BoxDecoration(
        //           color: Constants.instance.white,
        //           borderRadius: BorderRadius.circular(6),
        //           border: Border.all(color: Constants.instance.greyShade500, width: 0.75),
        //         ),
        //   ),
        // ),
      ],
    );
  }
}
