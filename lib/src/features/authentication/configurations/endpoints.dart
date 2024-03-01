import 'package:chap_mobile/src/config/base.dart';

class EndPoints {
  static const _base = BasePaths.baseUrl;
  static const String registerUser = '$_base/auth/register';
  static const String phoneExist = '$_base/auth/{phoneNumber}';
  static const String loginUser = '$_base/auth/login';
  static const String logoutUser = '$_base/auth/logout';
}
