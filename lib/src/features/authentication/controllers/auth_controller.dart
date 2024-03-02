import 'package:chap_mobile/src/features/authentication/configurations/messages.dart';
import 'package:chap_mobile/src/features/authentication/repositories/auth_repository.dart';
import 'package:chap_mobile/src/global/controllers/init_controller.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:chap_mobile/src/utils/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authenticationControllerProvider = Provider((ref) {
  final repository = ref.watch(authenticationRepositoryProvider);
  final credentials = ref.watch(initControllerProvider);
  return AuthenticationController(
      repository: repository, credentials: credentials);
});

class AuthenticationController {
  final AuthenticationRepository _repository;
  final InitController _credentials;

  AuthenticationController(
      {required AuthenticationRepository repository,
      required InitController credentials})
      : _repository = repository,
        _credentials = credentials;

  Future<User>? register({BuildContext? context, User? user}) async {
    final result = await _repository.register(user!);
    final userNull =
        User(firstName: "", lastName: "", password: "", phoneNumber: "");
    return result.fold((failure) {
      if (context != null) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.register,
            backgroundColor: AppColor.errorColor);
      }
      return userNull;
    }, (user) {
      if (context != null && user.phoneNumber == "") {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.verifyPhoneNumber,
            backgroundColor: AppColor.errorColor);
        return user;
      }
      if (context != null && user.phoneNumber != "") {
        context.pushNamed(AppRouteName.login);
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 1),
            context: context,
            message: SuccessMessage.register,
            backgroundColor: AppColor.successColor);
        return user;
      }
      return user;
    });
  }

  Future<String>? login({BuildContext? context, User? user}) async {
    final result = await _repository.login(user!.phoneNumber, user.password);

    return result.fold((failure) {
      if (context != null) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.login,
            backgroundColor: AppColor.errorColor);
      }
      return "";
    }, (token) {
      if (context != null && token == AppStrings.passwordError) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.login,
            backgroundColor: AppColor.errorColor);
        return token;
      }
      if (context != null && token != AppStrings.passwordError) {
        _credentials.initUserAndToken(user, token);
        context.pushNamed(AppRouteName.home);
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 1),
            context: context,
            message: SuccessMessage.login,
            backgroundColor: AppColor.successColor);
        return token;
      }
      return token;
    });
  }

  Future<String>? logout({BuildContext? context}) async {
    final result = await _repository.logout();

    return result.fold((failure) {
      if (context != null) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.logout,
            backgroundColor: AppColor.errorColor);
      }
      return "";
    }, (message) {
      if (context != null && message != AppStrings.serverLogout) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.logout,
            backgroundColor: AppColor.errorColor);
        return message;
      }
      if (context != null && message == AppStrings.serverLogout) {
        _credentials.clearUserAndToken();
        context.pushNamed(AppRouteName.splash);
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 1),
            context: context,
            message: SuccessMessage.logout,
            backgroundColor: AppColor.successColor);
        return message;
      }
      return message;
    });
  }
}
