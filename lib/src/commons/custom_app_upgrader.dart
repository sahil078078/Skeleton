// import 'package:flutter/material.dart';
// class CustomAppUpgrader extends StatelessWidget {
//   const CustomAppUpgrader({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return UpgradeAlert(
//       barrierDismissible: false,
//       dialogStyle: Constants.instance.isAndroid ? UpgradeDialogStyle.material : UpgradeDialogStyle.cupertino,
//       showLater: true,
//       showIgnore: false,
//       shouldPopScope: () => false,
//       showReleaseNotes: true,
//       upgrader: Upgrader(durationUntilAlertAgain: const Duration(hours: 1)),
//       child: child,
//     );
//   }
// }
