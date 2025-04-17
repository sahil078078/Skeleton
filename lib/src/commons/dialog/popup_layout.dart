import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeleton/src/utils/util.dart';
import '../../helper/app_extensions.dart';
import '../../constants/constant.dart';
import '../../helper/app_text_style.dart';
import '../custom_loading_indicator.dart';

class PopupContent extends StatelessWidget {
  const PopupContent({
    super.key,
    this.height,
    this.width,
    this.child,
    this.maxWidth,
  });

  final double? height, maxWidth;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // minHeight: (height ?? 280) * 0.75,
        minHeight: 0,
        maxHeight: height ?? 280,
        maxWidth: maxWidth ?? double.maxFinite,
      ),
      child: SizedBox(child: child),
    );
  }
}

class PopupHeader extends StatelessWidget {
  final GestureTapCallback? onSearch;
  final bool isSearch;
  final String headerTitle;
  final TextStyle? headerStyle;

  final Widget? end, start;
  final double startDistance;
  const PopupHeader({
    super.key,
    required this.headerTitle,
    this.headerStyle,
    this.onSearch,
    this.isSearch = false,
    this.end,
    this.start,
    this.startDistance = 0,
  }) : assert(
          (isSearch == true && onSearch != null) || (isSearch == false && onSearch == null),
          "if isSearch = true then must applied onSearch : ErrorMsg",
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        left: 15,
        right: 15,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (start != null) start ?? SizedBox.shrink(),
                  Constants.instance.square.copyWith(height: 0, width: startDistance),
                  Text(
                    headerTitle,
                    style: headerStyle ?? AppTextStyle.medium.copyWith(fontSize: 15.5),
                  ),
                ],
              ),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSearch)
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onSearch,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              "assets/icons/Search.svg",
                              height: 14,
                              width: 14,
                              colorFilter: ColorFilter.mode(
                                Constants.instance.grey600,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (end != null) end!
                  ],
                ),
              )
            ],
          ),
          Util.horizontalDivider(
            height: 0,
            padding: const EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}

class PopupFooter extends StatelessWidget {
  final double radius;
  final GestureTapCallback onSave;
  final GestureTapCallback? onCancel;
  final bool isLoading, isLoadingOnCancel;
  final String saveText, cancelText;
  final TextStyle? saveStyle, cancelStyle;
  const PopupFooter({
    super.key,
    required this.onSave,
    this.onCancel,
    this.radius = 8,
    this.isLoading = false,
    this.isLoadingOnCancel = false,
    this.saveText = "Save",
    this.cancelText = "Cancel",
    this.saveStyle,
    this.cancelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Constants.instance.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Util.horizontalDivider(height: 0, thickness: 1.5),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius))),
                    ),
                    onPressed: isLoadingOnCancel ? null : (onCancel /* ?? () => backScreen()*/),
                    child: !isLoadingOnCancel
                        ? Text(
                            cancelText,
                            style: cancelStyle ??
                                AppTextStyle.semiBold.copyWith(
                                  color: Constants.instance.grey600,
                                  fontSize: 14,
                                ),
                          )
                        : CustomLoadingIndicator(),
                  ),
                ),
              ),
              Container(
                width: 1.2,
                height: 40,
                color: Constants.instance.grey100,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(radius))),
                    ),
                    onPressed: !isLoading ? onSave : null,
                    child: !isLoading
                        ? Text(
                            saveText,
                            style: saveStyle ??
                                AppTextStyle.semiBold.copyWith(
                                  color: Constants.instance.black,
                                  fontSize: 14,
                                ),
                          )
                        : const CustomLoadingIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
