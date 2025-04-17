//package:app_links/src/app_links.dart
//app_links: ^6.4.0
// class DeepLinkService {
//   //! Singleton
//   DeepLinkService._();
//   static final instance = DeepLinkService._();
//   factory DeepLinkService() => instance;

//   static final _appLink = AppLinks();

//   //DeepLinkInit
//   static Future<void> initDeepLink() async {
//     // Handle cold start (example app are close)
//     final Uri? initialUri = await _appLink.getInitialLink();
//     if (initialUri != null) __handleDeepLink(initialUri);

//     //Listen while app is running
//     _appLink.uriLinkStream.listen(
//       (Uri? uri) {
//         if (uri != null) __handleDeepLink(uri);
//       },
//     );
//   }

//   static void __handleDeepLink(Uri uri) {
//     // Case 1: Handle  HTTPS URL -> https://startupweaver.itfuturz.in/api/users/invite/SAHIL078078

//     // if (uri.scheme == 'https' &&
//     //     uri.host == 'startupweaver.itfuturz.in' &&
//     //     uri.pathSegments.length >= 4 &&
//     //     uri.pathSegments[0] == 'api' &&
//     //     uri.pathSegments[1] == 'users' &&
//     //     uri.pathSegments[2] == 'invite') {
//     //   String referralCode = uri.pathSegments[3]; // Extract "SAHIL078078"
//     //   AppToasting.showGreyToast('DeepLink : $referralCode');
//     //   nextScreen(path: RoutePath.referNEarn);
//     //   // Get.toNamed('/referral?code=$referralCode'); //Navigate to referral page
//     // } else if (uri.scheme == 'startupweaver' && uri.host == 'invite' && uri.pathSegments.isNotEmpty) {
//     //   // Case 2: Handle legacy custom scheme startupweaver://invite/SAHIL078078
//     //   String referralCode = uri.pathSegments[0];
//     //   AppToasting.showGreyToast('DeepLink : $referralCode');
//     //   nextScreen(path: RoutePath.referNEarn);
//     //   // Get.toNamed('/referral?code=$referralCode');
//     // }

//     String? referralCode;

//     // Case 1: Handle new test URL -> https://xxgn1wm1-5000.inc1.devtunnels.ms/invite/Polai61A6X
//     if (uri.scheme == 'https' && uri.host == 'xxgn1wm1-5000.inc1.devtunnels.ms' && uri.pathSegments.length >= 2 && uri.pathSegments[0] == 'invite') {
//       referralCode = uri.pathSegments[1]; // Extract "Polai61A6X"
//     }
//     // Case 2: Handle production URL -> https://startupweaver.itfuturz.in/api/users/invite/SAHIL078078
//     else if (uri.scheme == 'https' &&
//         uri.host == 'startupweaver.itfuturz.in' &&
//         uri.pathSegments.length >= 4 &&
//         uri.pathSegments[0] == 'api' &&
//         uri.pathSegments[1] == 'users' &&
//         uri.pathSegments[2] == 'invite') {
//       referralCode = uri.pathSegments[3]; // Extract "SAHIL078078"
//     }
//     // Case 3: Handle custom scheme -> startupweaver://invite/SAHIL078078
//     else if (uri.scheme == 'startupweaver' && uri.host == 'invite' && uri.pathSegments.isNotEmpty) {
//       referralCode = uri.pathSegments[0];
//     }

//     if (referralCode != null) {
//       AppToasting.showGreyToast('DeepLink: $referralCode');
//       // Store code for later use

//       nextScreen(path: RoutePath.referNEarn);
//     }
//   }
// }
