import 'package:flutter/material.dart';
import '../../constants/constant.dart';

class CustomBackBtn<T> extends StatelessWidget {
  const CustomBackBtn({super.key, this.onTap, this.result, this.iconColor, this.bgColor});
  final GestureTapCallback? onTap;
  final T? result;
  final Color? iconColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap, //?? () => backScreen(result: result),
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgColor ?? Constants.instance.white,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: iconColor ?? Constants.instance.black,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
