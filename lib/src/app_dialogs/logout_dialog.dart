import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../commons/dialog/popup_layout.dart';
import '../constants/constant.dart';
import '../helper/app_text_style.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  bool isLoadingForLogout = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PopupHeader(
            headerTitle: 'Logout',
            headerStyle: AppTextStyle.semiBold.copyWith(fontSize: 15.5, color: Constants.instance.red),
            startDistance: 10,
            start: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SvgPicture.asset(
                'Graphics.instance.logOut2',
                width: 22,
                height: 22,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(Constants.instance.red, BlendMode.srcIn),
              ),
            ),
          ),
          Flexible(
            child: PopupContent(
              child: Padding(
                padding: Constants.instance.popupPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to logout?",
                      style: AppTextStyle.medium.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Constants.instance.square,
          PopupFooter(
            isLoading: isLoadingForLogout,
            saveText: "Logout",
            saveStyle: AppTextStyle.semiBold.copyWith(
              color: Constants.instance.red,
              fontSize: 14,
            ),
            onSave: () async {},
          ),
        ],
      ),
    );
  }
}
