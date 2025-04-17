import 'dart:io';
import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../helper/app_text_style.dart';
import 'btn/custom_icon_btn.dart';
import 'custom_network_image.dart';
import '../helper/app_extensions.dart';

class CustomEditableImageView extends StatelessWidget {
  final String? otherImage, imageUrl;
  final File? imageFile;
  final double? radius;
  final double? width, height, editBtnSize;
  final BoxFit? fit;
  final bool isEdited;
  final String? label;
  final GestureTapCallback? onEdit;
  final String? errorImage;
  final Widget? errorWidget;

  const CustomEditableImageView({
    super.key,
    this.otherImage,
    this.imageUrl,
    this.imageFile,
    this.width,
    this.height,
    this.editBtnSize,
    this.fit,
    this.isEdited = true,
    this.onEdit,
    this.label,
    this.radius,
    this.errorImage,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //! Image View
              CustomNetworkImage(
                radius: radius ?? 0,
                width: width,
                height: height,
                imageUrl: imageUrl,
                imageFile: imageFile,
                otherImage: otherImage,
                errorImage: errorImage,
                errorWidget: errorWidget,
                fit: fit ?? BoxFit.fill,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.instance.greyShade300,
                    width: 0.75,
                  ),
                  borderRadius: BorderRadius.circular(radius ?? 0),
                ),
              ),

              //! EDIT

              if (isEdited)
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: CustomIconBtn(
                    bgColor: Constants.instance.white,
                    radius: editBtnSize ?? 25,
                    width: editBtnSize ?? 25,
                    height: editBtnSize ?? 25,
                    svgHeight: 16,
                    svgWidth: 16,
                    //  svgPath: Graphics.instance.editPen,
                    color: Constants.instance.grey500,
                    border: Border.all(color: Constants.instance.grey200),
                    onTap: onEdit,
                  ),
                )
            ],
          ),
        ),
        if (label.notEmptyNotNull) ...[
          Constants.instance.square.copyWith(height: 06),
          Text("$label", style: AppTextStyle.medium.copyWith(fontSize: 12, color: Constants.instance.grey700)),
        ]
      ],
    );
  }
}
