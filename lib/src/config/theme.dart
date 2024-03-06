import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.backgroundWhiteColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColor.primaryTextColor,
        backgroundColor: AppColor.primaryColor),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    useMaterial3: true,
  );
}
