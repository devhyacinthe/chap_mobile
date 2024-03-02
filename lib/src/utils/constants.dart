import 'package:flutter/material.dart';

class AppRouteName {
  AppRouteName._();

  static const String welcome = 'welcome';
  static const String register = 'register';
  static const String login = 'login';
  static const String home = 'home';
  static const String password = 'password';
  static const String splash = 'splash';
}

class AppColor {
  AppColor._();

  static const Color primaryColor = Color(0xFF8A39E0);
  static const Color primaryTextColor = Color(0xFFFFFFFF); //Color(0xFFF0F0FF);
  static const Color backgroundColor = Color(0xFFFFFFFE);
  static const Color backgroundTextColor = Color(0xFF291142);
  static const Color backgroundTextSecondaryColor = Color(0xFF214173);
  static const Color secondaryColor = Color(0xFFA3005A);
  static const Color secondaryTextColor = Color(0xFFFFFFFF);
  static const Color successAccentColor = Colors.greenAccent;
  static const Color errorAccentColor = Colors.redAccent;
  static const Color successColor = Colors.green;
  static const Color errorColor = Colors.red;
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
  static const appName = "Chap";
  static const welcomeTitle = "Bienvenue";
  static const registerTitle = "Inscription";
  static const registerSubTitle =
      "Inscrivez vous en ajoutant les informations suivantes";
  static const loginTitle = "Connexion";
  static const loginSubTitle =
      "Connectez vous à votre compte avec votre numéro de téléphone";
  static const passwordTitle = "Vérification";
  static const passwordSubTitle = "Entrez votre code pour vous connecter";
  static const loginInfo = "Vous n'avez pas de compte?";
  static const passwordError =
      "Une erreur s'est produite verifier votre numero de téléphone ou votre mot de passe";
  static const serverLogout = "User have been logged out!";
}

class NetworkFailureMessage {
  static const getRequestMessage = "GET REQUEST FAILED";
  static const postRequestMessage = "POST REQUEST FAILED";
  static const putRequestMessage = "PUT REQUEST FAILED";
  static const deleteRequestMessage = "DELETE REQUEST FAILED";

  static const jsonParsingFailed = "FAILED TO PARSE JSON RESPONSE";

  static const authTokenEmpty = "AUTH TOKEN EMPTY";
}

class LogLabel {
  static const auth = "AUTH";
  static const httpGet = "HTTP/GET";
  static const httpPost = "HTTP/POST";
  static const httpPut = "HTTP/PUT";
  static const httpDelete = "HTTP/DELETE";
  static const sharedPrefs = "SHARED_PREFERENCES";
}
