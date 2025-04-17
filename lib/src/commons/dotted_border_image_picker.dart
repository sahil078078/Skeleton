import 'dart:io';
import 'package:flutter/material.dart';
import '../helper/app_extensions.dart';
import '../constants/constant.dart';
import '../helper/app_text_style.dart';
import '../source/dotted_border_source.dart';
import 'btn/custom_icon_btn.dart';

class DottedBorderImagePickerCard extends StatelessWidget {
  const DottedBorderImagePickerCard({
    super.key,
    this.width,
    this.height,
    this.onTap,
    this.onDelete,
    this.image,
    this.text,
  });

  final double? width, height;
  final GestureTapCallback? onTap, onDelete;
  final String? text;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return DottedBorderSource(
      color: Constants.instance.primary,
      radius: const Radius.circular(10),
      dashPattern: const [8, 7],
      gradient: LinearGradient(
        colors: [Constants.instance.jordyBlue, Constants.instance.primary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderType: BorderType.rRect,
      strokeWidth: 2,
      borderPadding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: Constants.instance.blue50,
          borderRadius: BorderRadius.circular(10),
        ),
        width: width ?? double.maxFinite,
        height: height ?? 180,
        child: image == null
            ? InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  SvgPicture.asset(Graphics.instance.camera, width: 45, height: 45),
                      Constants.instance.square.copyWith(height: 10),
                      Text(
                        text ?? 'Upload Announcement\nPicture',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular.copyWith(fontSize: 14, height: 1.3, color: Constants.instance.primary),
                      ),
                    ],
                  ),
                ),
              )
            : Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.antiAlias,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(image!, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: CustomIconBtn(
                      //     svgPath: Graphics.instance.trash,
                      color: Constants.instance.red,
                      bgColor: Constants.instance.white,
                      width: 35,
                      height: 35,
                      svgHeight: 20,
                      svgWidth: 20,
                      onTap: onDelete,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
