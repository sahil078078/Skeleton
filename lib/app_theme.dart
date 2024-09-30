import 'package:flutter/material.dart';
import 'src/constants/constant.dart';
import 'src/helper/app_text_style.dart';

class AppTheme {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Constant.instance.primarySwatch),
    scaffoldBackgroundColor: Constant.instance.bgColor,
    primarySwatch: Constant.instance.primarySwatch,
    useMaterial3: true,
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Constant.instance.white,
      centerTitle: false,
      titleTextStyle: AppTextStyle.bold.copyWith(fontSize: 18),
      scrolledUnderElevation: 00,
      surfaceTintColor: Constant.instance.white,
      // titleSpacing: 00,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        foregroundColor: WidgetStateProperty.all<Color>(Constant.instance.greyShade500),
        visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity, horizontal: VisualDensity.minimumDensity),
        backgroundColor: WidgetStateProperty.all(Constant.instance.primary),
        animationDuration: const Duration(milliseconds: 400),
        textStyle: WidgetStateProperty.all<TextStyle>(AppTextStyle.medium),
        alignment: Alignment.center,
        enableFeedback: false,
        surfaceTintColor: WidgetStateProperty.all<Color>(Constant.instance.white),
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constant.instance.white,
      selectedItemColor: Constant.instance.primary,
      unselectedItemColor: Constant.instance.grey500,
      elevation: 1,
      enableFeedback: false,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      mouseCursor: WidgetStateProperty.all(MouseCursor.uncontrolled),
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      selectedIconTheme: IconThemeData(color: Constant.instance.primary, size: 25),
      unselectedIconTheme: IconThemeData(color: Constant.instance.grey500, size: 23),
      selectedLabelStyle: AppTextStyle.semiBold.copyWith(color: Constant.instance.primary, fontSize: 12),
      unselectedLabelStyle: AppTextStyle.medium.copyWith(color: Constant.instance.grey500, fontSize: 11),
    ),
    checkboxTheme: const CheckboxThemeData(
      visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
