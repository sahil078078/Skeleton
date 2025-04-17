// Future<String?> getMyFCMToken() async {
//   try {
//     final firebaseMessaging = FirebaseMessaging.instance;
//     String? fcmToken;

//     await firebaseMessaging.requestPermission();

//     if (Constants.instance.isAndroid) {
//       fcmToken = await firebaseMessaging.getToken();
//     } else {
//       //! FOR IOS
//       String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();

//       if (apnsToken != null) {
//         debugPrint('FIRST');
//         fcmToken = await FirebaseMessaging.instance.getToken();
//       } else {
//         await Future.delayed(Duration(seconds: 3));
//         apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//         if (apnsToken != null) {
//           debugPrint('SECOND');
//           fcmToken = await FirebaseMessaging.instance.getToken();
//         }
//       }
//     }

//     debugPrint("FCM ANDROID : ${Constants.instance.isAndroid} => $fcmToken");

//     sharedPref.userFCM = fcmToken ?? "";

//     return fcmToken;
//   } on FirebaseException catch (error) {
//     debugPrint("FIREBASE Exception FCM ERROR : $error");
//     debugPrint("FIREBASE Exception FCM ERROR : ${error.code}");
//     debugPrint("FIREBASE Exception FCM ERROR : ${error.message}");
//     return null;
//   } catch (e) {
//     debugPrint("FIREBASE FCM ERROR : $e");
//     return null;
//   }
// }
