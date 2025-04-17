import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../constants/constant.dart';
import '../helper/app_extensions.dart';
import 'app_toasting.dart';

class AppUrl {
  /// Default function -> This will handle all try of launch activity
  /// if its possible to launch then launch otherwise it will toast an errorMsg
  /// This function make private because prevent access outside from class
  static Future<void> _myUriLaunch({
    required String url,
    LaunchMode mode = LaunchMode.platformDefault,
    WebViewConfiguration webViewConfiguration = const WebViewConfiguration(enableJavaScript: true),
    String notLaunchMsg = "Unable to open url",
    String errorMsg = "Something went wrong",
  }) async {
    try {
      final uri = Uri.parse(url);
      final willLaunch = await canLaunchUrl(uri);
      if (willLaunch) {
        await launchUrl(
          uri,
          mode: mode,
          webViewConfiguration: webViewConfiguration,
        );
      } else {
        Fluttertoast.showToast(msg: notLaunchMsg);
      }
    } catch (e) {
      debugPrint('catchError : $e');
      Fluttertoast.showToast(msg: errorMsg);
    }
  }

  ///! Launch un url

  static Future<void> urlLaunch({
    required String url,
    LaunchMode mode = LaunchMode.inAppBrowserView,
    String notLaunchMsg = "Unable to open url",
    String errorMsg = "Failed to open url",
  }) async =>
      await _myUriLaunch(
        url: url,
        mode: mode,
        notLaunchMsg: notLaunchMsg,
        errorMsg: errorMsg,
      );

  ///! send mail

  static Future<void> mail({
    String? email,
    String? subject,
    String? body,
    String notLaunchMsg = "Unable to send mail",
    String errorMsg = "Failed to send mail",
  }) async {
    if (!email.notEmptyNotNull) {
      AppToasting.showGreyToast("No email found");
      return;
    }
    await _myUriLaunch(
      url: Uri(
        scheme: 'mailto',
        path: email,
        query: '''subject=${subject ?? ''}&body=${body ?? ''}''',
      ).toString(),
      notLaunchMsg: notLaunchMsg,
      errorMsg: errorMsg,
    );
  }

  ///! send SMS

  static Future<void> sms({
    required String mobile,
    String? body,
    String notLaunchMsg = "Unable to send sms",
    String errorMsg = "Failed to send sms",
  }) async =>
      await _myUriLaunch(
        url: Uri(
          scheme: 'sms',
          path: mobile,
          query: '''body=${body ?? ''}''',
        ).toString(),
        notLaunchMsg: notLaunchMsg,
        errorMsg: errorMsg,
      );

  ///! Call

  static Future<void> call({
    required String mobile,
    String notLaunchMsg = "Unable to dial call",
    String errorMsg = "Failed to call",
  }) async =>
      await _myUriLaunch(
        url: Uri(
          scheme: "tel",
          path: mobile,
        ).toString(),
        notLaunchMsg: notLaunchMsg,
        errorMsg: errorMsg,
      );

  ///! WhatsApp

  static Future<void> whatsApp({
    required String mobile,
    String? msg,
    String countryCode = '91',
    String notLaunchMsg = "Unable to open whatsapp",
    String errorMsg = "Failed to open whatsapp",
  }) async {
    String link = "https://api.whatsapp.com/send/?phone=$countryCode$mobile&text=${msg ?? ''}";
    await _myUriLaunch(
      url: Uri.parse(
        link,
      ).toString(),
      notLaunchMsg: notLaunchMsg,
      errorMsg: errorMsg,
    );
  }

  static Future<void> mapLaunch({
    required double latitude,
    required double longitude,
    bool isCheckPlatform = false,
  }) async {
    final Uri mapsUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps',
      queryParameters: {
        'q': '$latitude,$longitude',
      },
    );

    // For iOS, use Apple Maps if Google Maps is not installed
    final Uri appleMapsUri = Uri(
      scheme: 'https',
      host: 'maps.apple.com',
      queryParameters: {
        'q': '$latitude,$longitude',
      },
    );

    if (isCheckPlatform) {
      if (Constants.instance.isAndroid) {
        await _myUriLaunch(url: "$mapsUri");
      } else {
        await _myUriLaunch(url: "$appleMapsUri");
      }
    } else {
      try {
        if (await canLaunchUrl(mapsUri)) {
          await launchUrl(mapsUri);
        } else if (await canLaunchUrl(appleMapsUri)) {
          // Fallback to Apple Maps on iOS if Google Maps is not available
          await launchUrl(appleMapsUri);
        } else {
          AppToasting.showGreyToast("Unable to open map");
        }
      } catch (e) {
        debugPrint("Map Launch Error : $e");
        AppToasting.showGreyToast("Map Launch Failed");
      }
    }
  }
}
