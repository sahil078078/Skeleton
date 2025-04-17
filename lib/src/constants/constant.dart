import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants with _ColorMixin, _NumericalMixin, _ConstMixin {
  Constants._(); //!private constructor
  factory Constants() => instance; //!SingleTone
  static final instance = Constants._(); //!Instance
}

//! Colors
mixin _ColorMixin {
  //primary
  static const primaryInt = 0xff183883;
  final primary = const Color(primaryInt);
  final bgColor = const Color(0xffF5F5F5);

  final primarySwatch = const MaterialColor(
    primaryInt,
    <int, Color>{
      50: Color.fromRGBO(24, 56, 131, 0.1),
      100: Color.fromRGBO(24, 56, 131, 0.2),
      200: Color.fromRGBO(24, 56, 131, 0.3),
      300: Color.fromRGBO(24, 56, 131, 0.4),
      400: Color.fromRGBO(24, 56, 131, 0.5),
      500: Color.fromRGBO(24, 56, 131, 0.6),
      600: Color.fromRGBO(24, 56, 131, 0.7),
      700: Color.fromRGBO(24, 56, 131, 0.8),
      800: Color.fromRGBO(24, 56, 131, 0.9),
      900: Color.fromRGBO(24, 56, 131, 1),
    },
  );

  final black = const Color(0xff1E1F20);
  final white = const Color(0xffffffff);
  final red = const Color(0xffF13637);
  final blueViolet = const Color(0xff8434F4);
  final magnolia = const Color(0xffF3EBFE);
  final americanYellow = const Color(0xffEFB203);
  final cosmicLatte = const Color(0xffFEF8E6);
  final apple = const Color(0xff4BB543);
  final honeyDue = const Color(0xffEDF8ED);

  //!Opacity
  final primary15 = const Color(0x26183883);
  final redLight = const Color(0xffFEEBEB);
  final blue50 = const Color(0xffF1F5FF);
  final red10 = const Color(0x1AF13637);
  final apple10 = const Color(0x1A4BB543);
  final transparent = Colors.transparent;
  static const shadow = Color(0x1A000000);

  //!grey
  final grey100 = const Color(0xffEDEEF1);
  final grey200 = const Color(0xffD8DBDF);
  final grey400 = const Color(0xff8E95A2);
  final grey500 = const Color(0xff6B7280);
  final grey600 = const Color(0xff666666);
  final grey700 = const Color(0xff4A4E5A);
  final grey800 = const Color(0xff40444C);
  final grey950 = const Color(0xff25272C);

  final greyShade50 = const Color(0xFFFAFAFA);
  final greyShade100 = const Color(0xFFF5F5F5);
  final greyShade200 = const Color(0xFFEEEEEE);
  final greyShade300 = const Color(0xFFE0E0E0);
  final greyShade400 = const Color(0xFFE9E9E9);
  final greyShade500 = const Color(0xFFBDBDBD);
  final greyShade600 = const Color(0xFF757575);
  final greyShade700 = const Color(0xFF616161);
  final greyShade800 = const Color(0xFF424242);
  final greyShade900 = const Color(0xFF212121);

  final blue400 = const Color(0xff78A0FF);
  final blue500 = const Color(0xff5D87E9);
  final blue600 = const Color(0xff4169C7);
  final blue800 = const Color(0xff183883);

  final jordyBlue = const Color(0xff96B6FF);

  final successToast = const Color.fromRGBO(72, 215, 97, 1);
  final errorToast = const Color.fromRGBO(255, 52, 91, 1);
  final infoToast = const Color.fromRGBO(45, 135, 232, 1);
  final warningToast = const Color.fromRGBO(255, 191, 37, 1);
  final toast = const Color(0xff474747);
}

mixin _NumericalMixin {
  final SizedBox square = const SizedBox(width: 15, height: 15);
  final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 13);
  final EdgeInsets popupPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  final boxShadow = <BoxShadow>[const BoxShadow(color: _ColorMixin.shadow, offset: Offset(0, 1), blurRadius: 2)];
}

mixin _ConstMixin {
  //!Strings
  final developmentFlavorSrg = 'Dev';
  final productionFlavorSrg = 'Pro';

  //! Booleans
  final bool isDebug = kDebugMode == true && kReleaseMode == false && kProfileMode == false;

  //! Platform
  final bool isAndroid = Platform.isAndroid && !Platform.isIOS;
}
