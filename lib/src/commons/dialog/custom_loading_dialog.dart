import 'package:flutter/material.dart';

class CustomLoadingDialog {
  CustomLoadingDialog._();

  static showLoading({
    required BuildContext context,
    String text = 'Loading',
    Color? bgColor,
    Color? loadingColor,
    TextStyle? style,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext cnx) {
        return PopScope(
          canPop: false,
          child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: _customDialog(
              context: cnx,
              text: text,
              bgColor: bgColor,
              loadingColor: loadingColor,
              style: style,
            ),
          ),
        );
      },
    );
  }

  static hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static _customDialog({
    required BuildContext context,
    required String text,
    Color? bgColor,
    Color? loadingColor,
    TextStyle? style,
  }) {
    return SizedBox(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(loadingColor ?? Colors.white),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  text,
                  style: style ??
                      TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
