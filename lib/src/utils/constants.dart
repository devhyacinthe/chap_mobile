import 'package:flutter/material.dart';

class AppRouteName {
  AppRouteName._();

  static const String welcome = 'welcome';
  static const String navigation = 'navigation';
  static const String register = 'register';
  static const String login = 'login';
  static const String home = 'home';
  static const String password = 'password';
  static const String splash = 'splash';
  static const String notification = 'notifications';
  static const String settings = 'settings';
  static const String account = 'account';
  static const String sale = 'sales';
  static const String product = 'products';
  static const String client = 'clients';
}

class AppColor {
  AppColor._();

  static const Color primaryColor = Color(0xFF8A39E0);
  static const Color primaryTextColor = Color(0xFFFFFFFF); //Color(0xFFF0F0FF);
  static const Color backgroundWhiteColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFFCFCFC);
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
      fontSize: 32,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      color: AppColor.backgroundTextColor);

  static TextStyle primaryMedium = const TextStyle(
      fontSize: 20,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle secondaryMedium = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle primaryTiny = const TextStyle(
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle secondaryTiny = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle buttonText = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.primaryTextColor);

  static TextStyle enabledButtonText = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle buttonText2 = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.primaryColor);

  static TextStyle primaryMiny = const TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle secondaryMiny = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle secondaryMinyTextButton = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColor.primaryColor);

  static TextStyle appBarTitle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle bottomPhoneNumber = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle account = const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle appBarSubTitle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle appBarSubTitleBold = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle bottomLabel = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle bottomLabelActive = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: AppColor.primaryColor);

  static TextStyle tileSetting = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextColor);

  static TextStyle tileSettingFilled = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w200,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle tileSettingFilled2 = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextSecondaryColor);

  static TextStyle cgu = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
      color: AppColor.primaryColor);

  static TextStyle version = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
      color: AppColor.backgroundTextSecondaryColor);
}

class AppSize {
  AppSize._();

  static const EdgeInsetsGeometry paddingPage =
      EdgeInsets.symmetric(horizontal: 30, vertical: 50);
  static const EdgeInsetsGeometry paddingSettingPage =
      EdgeInsets.symmetric(horizontal: 15, vertical: 20);

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
  static const updatedProfileError = "Une erreur s'est produite";
  static const serverLogout = "User have been logged out!";

  static const String cdu = "Conditions générales d'utilisation";
  static const String contact = "Découvrir notre entreprise et contactez-nous";

  static const String version = "0.1.0";
  static const String logout = "Se déconnecter";
  static const String accountSettings = "Paramètres du compte";
  static const String help = "Contacter le support";
  static const String aPropos = "A propos";
  static const String share = "Partager Chap";
  static const String accountPhoneNumber = "Numéro de tel.";
  static const String accountCountry = "Pays";
  static const String accountFirstName = "Prenom*";
  static const String accountLastName = "Nom de famille";
  static const String accountEmail = "Email";
  static const String accountGender = "Sexe";
  static const String accountBirthDay = "Date d'anniversaire";
  static const String phoneNumberInfo =
      "Il n'est pas possible de modifier votre numéro de téléphone directement. Si vous rencontrez des problèmes ou si vous souhaitez procéder à un changement, veuillez contacter le support.";
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
