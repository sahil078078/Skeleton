// import 'package:permission_handler/permission_handler.dart' as per;

// import '../constants/constant.dart';

// class AppPermission {
//   static Future<bool> storagePermission() async {
//     bool havePermission = false;

//     if (Constants.instance.isAndroid) {
//       final DeviceInfoPlugin info = DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart';
//       final AndroidDeviceInfo androidInfo = await info.androidInfo;
//       debugPrint('releaseVersion | API VERSION : ${androidInfo.version.sdkInt}');
//       debugPrint('releaseVersion | ANDROID VERSION : ${androidInfo.version.release}');
//       final int androidVersion = androidInfo.version.sdkInt;

//       // Here you can use android api level
//       // like android api level 33 = android 13
//       // This way you can also find out how to request storage permission

//       if (androidVersion >= 33) {
//         final request = await [
//           per.Permission.videos,
//           per.Permission.photos,
//           // Permission.storage,
//         ].request();

//         havePermission = request.values.every((status) => status == per.PermissionStatus.granted);
//       } else {
//         final status = await per.Permission.storage.request();
//         havePermission = status.isGranted;
//       }

//       if (!havePermission) {
//         // if no permission then open app-setting
//         await per.openAppSettings();
//       }
//     } else {
//       final request = await [
//         per.Permission.storage,
//         per.Permission.mediaLibrary,
//       ].request();

//       havePermission = request.values.every((status) => status == per.PermissionStatus.granted);
//       if (!havePermission) {
//         await per.openAppSettings();
//       }
//     }
//     return havePermission;
//   }

//   static Future<bool> contactPermission() async {
//     final status = await per.Permission.contacts.request();

//     if (status == per.PermissionStatus.granted) {
//       return true;
//     } else if (status == per.PermissionStatus.denied || status == per.PermissionStatus.permanentlyDenied || status == per.PermissionStatus.restricted) {
//       await per.openAppSettings();
//       final status = await per.Permission.contacts.request();

//       if (status == per.PermissionStatus.granted) {
//         return true;
//       } else {
//         return false;
//       }
//     } else {
//       return false;
//     }
//   }

//   //package:geolocator/geolocator.dart
//   static Future<bool> locationPermission() async {
//     LocationPermission permission = await Geolocator.requestPermission();

//     if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
//       return Future.value(true);
//     } else if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever ||
//         permission == LocationPermission.unableToDetermine) {
//       await AppSettings.openAppSettings(type: AppSettingsType.location);
//       // await Geolocator.openAppSettings(); //! WOW
//       await Future.delayed(Duration(milliseconds: 50));
//       LocationPermission request = await Geolocator.requestPermission();

//       if (request == LocationPermission.always || request == LocationPermission.whileInUse) {
//         return Future.value(true);
//       } else {
//         return Future.value(false);
//       }
//     } else {
//       return Future.value(false);
//     }
//   }
// }
