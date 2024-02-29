import 'package:flutter/material.dart';

class AppRouteName {
  AppRouteName._();

  static const String welcome = 'welcome';
  static const String register = 'register';
  static const String login = 'login';
  static const String home = 'home';
  static const String password = 'password';
}

class AppColor {
  AppColor._();

  static const Color primaryColor = Color(0xFF8A39E0);
  static const Color primaryTextColor = Color(0xFFF0F0FF);
  static const Color backgroundColor = Color(0xFFFFFFFE);
  static const Color backgroundTextColor = Color(0xFF291142);
  static const Color backgroundTextSecondaryColor = Color(0xFF214173);
  static const Color secondaryColor = Color(0xFFA3005A);
  static const Color secondaryTextColor = Color(0xFFFFFFFF);
}

class AppText {
  AppText._();

  static TextStyle large = const TextStyle(
      fontSize: 38,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      color: AppColor.backgroundTextColor);

  static TextStyle primaryMedium = const TextStyle(
      fontSize: 24,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle secondaryMedium = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle primaryTiny = const TextStyle(
      fontSize: 18,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle secondaryTiny = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle buttonText = const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.primaryTextColor);

  static TextStyle buttonText2 = const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle primaryMiny = const TextStyle(
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle secondaryMiny = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);
}

class AppSize {
  AppSize._();

  static const EdgeInsetsGeometry paddingPage =
      EdgeInsets.symmetric(horizontal: 30, vertical: 50);

  static const double textfieldSpace = 15;
}

class AppStrings {
  static const appName = "Riverpod app template";
}

class FailureMessage {
  static const getRequestMessage = "GET REQUEST FAILED";
  static const postRequestMessage = "POST REQUEST FAILED";
  static const putRequestMessage = "PUT REQUEST FAILED";
  static const deleteRequestMessage = "DELETE REQUEST FAILED";

  static const jsonParsingFailed = "FAILED TO PARSE JSON RESPONSE";

  static const authTokenEmpty = "AUTH TOKEN EMPTY";
}

class LogLabel {
  static const product = "PRODUCT";
  static const auth = "AUTH";
  static const httpGet = "HTTP/GET";
  static const httpPost = "HTTP/POST";
  static const httpPut = "HTTP/PUT";
  static const httpDelete = "HTTP/DELETE";
  static const sharedPrefs = "SHARED_PREFERENCES";
}
