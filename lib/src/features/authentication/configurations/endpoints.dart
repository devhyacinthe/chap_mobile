import 'package:chap_mobile/src/config/base.dart';

class EndPoints {
  static const _base = BasePaths.baseUrl;
  //static const _baseProd = BasePaths.baseProdUrl;
  static const String registerUser = '$_base/seller/auth/register';
  static const String loginUser = '$_base/seller/auth/login';
  static const String logoutUser = '$_base/seller/auth/logout';
}
